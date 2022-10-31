import 'package:app/06_Form_Basico/pessoa.dart';
import 'package:flutter/material.dart';

class DadosPage extends StatelessWidget {
  const DadosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pessoa = ModalRoute.of(context)!.settings.arguments as Pessoa;
    return Scaffold(
      appBar: AppBar(title: const Text('Dados Pessoais'), centerTitle: true),
      body: _body(pessoa),
    );
  }

  Container _body(pessoa) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${pessoa.nome} ${pessoa.sobrenome}',
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            'E-mail: ${pessoa.email}',
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            'Senha: ${pessoa.senha}',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
