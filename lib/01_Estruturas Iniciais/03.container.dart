import 'package:flutter/material.dart';

// *********************************
//
// Widget Container
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
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Container'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.orange,
          height: 300,
          width: 300,
          margin: const EdgeInsets.only(left: 50, top: 50),
          padding: const EdgeInsets.all(50),
          alignment: Alignment.bottomRight,
          child: const Text(
            'Hello World!',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
