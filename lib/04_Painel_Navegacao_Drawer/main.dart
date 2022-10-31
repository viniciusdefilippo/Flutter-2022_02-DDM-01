import 'package:app/04_Painel_Navegacao_Drawer/routes.dart';
import 'package:flutter/material.dart';

// *********************************
//
// Painel Navegacao Drawer
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
        primarySwatch: Colors.yellow,
      ),
      routes: routes(),
    );
  }
}
