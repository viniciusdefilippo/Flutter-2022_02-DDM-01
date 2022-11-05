import 'package:app/08_Produtos_SQlite/produto.dart';
import 'package:app/08_Produtos_SQlite/produtoDao.dart';
import 'package:app/08_Produtos_SQlite/produto_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProdutoDao db = ProdutoDao();
  List<Produto> _listaProdutos = [];

  @override
  void initState() {
    super.initState();
    atualizarListaProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CRUD Produtos'), centerTitle: true),
      body: ListView.builder(
        itemCount: _listaProdutos.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
            direction: DismissDirection.startToEnd,
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
            onDismissed: (direcao) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (inContext) {
                  return WillPopScope(
                    onWillPop: () async => false,
                    child: AlertDialog(
                      title: Text('Deseja mesmo excluir o produto?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(inContext);
                            atualizarListaProdutos();
                          },
                          child: Text('Não'),
                        ),
                        TextButton(
                          onPressed: () {
                            removerProduto(_listaProdutos[index].id);
                            Navigator.pop(inContext);
                            atualizarListaProdutos();
                          },
                          child: Text('Sim'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: ListTile(
              leading: const Icon(
                Icons.check_circle_rounded,
                color: Colors.green,
                size: 25,
              ),
              title: Text(_listaProdutos[index].nome!),
              subtitle: Text(
                  'R\$ ${_listaProdutos[index].preco!.toStringAsFixed(2)}'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                exibeProdutoPage(_listaProdutos[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          exibeProdutoPage();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void exibeProdutoPage([Produto? produto]) async {
    final produtoRecebido = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProdutoPage(produto: produto)));
    if (produtoRecebido != null) {
      if (produto != null) {
        await db.updateProduto(produtoRecebido);
      } else {
        await db.insertProduto(produtoRecebido);
      }
      atualizarListaProdutos();
    }
  }

  void atualizarListaProdutos() {
    db.getProdutos().then((lista) {
      setState(() {
        _listaProdutos = lista;
      });
    });
  }

  void removerProduto(idProduto) async {
    await db.deleteProduto(idProduto);
  }
}
