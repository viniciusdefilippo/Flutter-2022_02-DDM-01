import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Meu primeiro Aplicativo'),
        ),
        body: const Center(
          child: Text('Hello World Flutter!'),
        ),
      ),
    ),
  );
}
