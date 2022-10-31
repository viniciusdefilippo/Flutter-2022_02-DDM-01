import 'package:app/06_Form_Basico/pessoa.dart';
import 'package:app/06_Form_Basico/routes.dart';
import 'package:app/06_Form_Basico/validation.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  CadastroPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final Validation validar = Validation();
  final Pessoa usuario = Pessoa();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Cadastro'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Entre com seu nome',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  validator: (nome) => validar.campoNome(nome.toString()),
                  onSaved: (String? value) {
                    usuario.nome = value;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Sobrenome',
                    hintText: 'Entre com seu sobrenome',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (sobrenome) =>
                      validar.campoSobreNome(sobrenome.toString()),
                  onSaved: (String? value) {
                    usuario.sobrenome = value;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'Entre com seu e-mail',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) => validar.campoEmail(email.toString()),
                  onSaved: (String? value) {
                    usuario.email = value;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Entre com sua senha',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  validator: (senha) => validar.campoSenha(senha.toString()),
                  onFieldSubmitted: (value) {
                    _onSubmit(context);
                  },
                  onSaved: (String? value) {
                    usuario.senha = value;
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    child: const Text('Cadastrar'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      _onSubmit(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit(inContext) {
    if (_formKey.currentState!.validate()) {
      print('Formulário Validado!');
      // Salva os dados preenchido no formulário através
      // das propriedades onSaved de cada campo do formulário
      _formKey.currentState!.save();

      // chama a rota nomeada enviando enviando os dados do usuário
      // só que agora os dados do usuário são enviados
      // como argumentos da rota
      Navigator.of(inContext)
          .pushNamed(Routes.PAGINA_DADOS, arguments: usuario);
    } else {
      print('********* Formulário com erros. ********');
      showDialog(
        context: inContext,
        barrierDismissible: false,
        builder: (inContext) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: const Text('Dados Inválidos!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(inContext);
                  },
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(inContext);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
