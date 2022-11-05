import 'package:flutter/material.dart';
import 'package:app/08_Produtos_SQlite/home_page.dart';

// *********************************
//
// CRUD - PRODUTOS com SQflite
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
      home: const HomePage(),
    );
  }
}
