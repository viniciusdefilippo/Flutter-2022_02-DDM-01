import 'package:app/06_Form_Basico/cadastro_page.dart';
import 'package:app/06_Form_Basico/dados_page.dart';
import 'package:app/06_Form_Basico/routes.dart';
import 'package:flutter/material.dart';

// *********************************
//
// Formulário Básico
//
// *********************************

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        Routes.HOME: (context) => CadastroPage(),
        Routes.PAGINA_DADOS: (context) => const DadosPage(),
      },
    );
  }
}
