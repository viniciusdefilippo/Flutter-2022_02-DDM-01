import 'package:app/07_Lista_Tarefas/tarefasDao.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _listaTarefas = [];
  TarefasDao db = TarefasDao();
  final _tarefaController = TextEditingController();
  Map<String, dynamic>? _ultimoItemRemovido;
  int? _posicaoUltimoItemRemovido;

  @override
  void initState() {
    super.initState();

    db.readData().then(
      (data) {
        setState(() {
          _listaTarefas = json.decode(data!);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ToDo'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: _atualiza,
                child: ListView.builder(
                  itemCount: _listaTarefas.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      //direction: DismissDirection.startToEnd,
                      key:
                          Key(DateTime.now().millisecondsSinceEpoch.toString()),
                      background: Container(
                        color: Colors.red,
                        child: const Align(
                          alignment: Alignment(-0.9, 0),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      secondaryBackground: Container(
                        color: Colors.green,
                        child: const Align(
                          alignment: Alignment(0.9, 0),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: CheckboxListTile(
                        title: Text(_listaTarefas[index]['descricao']),
                        value: _listaTarefas[index]['ok'],
                        secondary: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: _listaTarefas[index]['ok']
                              ? Colors.green
                              : Colors.red,
                          child: Icon(_listaTarefas[index]['ok']
                              ? Icons.check
                              : Icons.close),
                        ),
                        onChanged: (checked) {
                          setState(() {
                            _listaTarefas[index]['ok'] = checked;
                            db.saveData(_listaTarefas);
                          });
                        },
                      ),
                      onDismissed: (direcao) {
                        _ultimoItemRemovido = Map.from(_listaTarefas[index]);
                        _posicaoUltimoItemRemovido = index;
                        _listaTarefas.removeAt(index);
                        db.saveData(_listaTarefas);
                        //print('Direção: $direcao');
                        if (direcao == DismissDirection.startToEnd) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 2),
                              content: Text(
                                '${_ultimoItemRemovido!['descricao']} removido(a).',
                                style: const TextStyle(color: Colors.yellow),
                              ),
                              action: SnackBarAction(
                                label: 'Desfazer',
                                onPressed: () {
                                  setState(() {
                                    _listaTarefas.insert(
                                      _posicaoUltimoItemRemovido!,
                                      _ultimoItemRemovido,
                                    );
                                    db.saveData(_listaTarefas);
                                  });
                                },
                              ),
                            ),
                          );
                          //print('Direção: Início para o Fim');
                        }
                        if (direcao == DismissDirection.endToStart) {
                          print('Direção: $direcao');
                          setState(() {
                            _listaTarefas.insert(_posicaoUltimoItemRemovido!,
                                _ultimoItemRemovido);
                            _listaTarefas[index]['ok'] =
                                !_listaTarefas[index]['ok'];
                            db.saveData(_listaTarefas);
                          });
                        }
                      },
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                child: TextFormField(
                  controller: _tarefaController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Tarefa',
                    hintText: 'Entre com a tarefa',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                  ),
                  onFieldSubmitted: (texto) {
                    _onSubmit(context, texto);
                  },
                ),
              ),
            )
          ],
        ));
  }

  void _onSubmit(context, texto) {
    if (texto.toString().isNotEmpty) {
      setState(() {
        Map<String, dynamic> novaTarefa = {};
        novaTarefa['descricao'] = _tarefaController.text;
        _tarefaController.clear();
        novaTarefa['ok'] = false;
        _listaTarefas.add(novaTarefa);
        db.saveData(_listaTarefas);
      });
      //print('Tarefa adicionada!!!!');
    } else {
      //print('Sem Tarefa preenchida');
    }
  }

  Future<void> _atualiza() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _listaTarefas.sort((a, b) {
        return (a['ok'].toString()).compareTo(b['ok'].toString());
      });
      db.saveData(_listaTarefas);
    });
  }
}
