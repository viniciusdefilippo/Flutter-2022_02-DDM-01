import 'package:flutter/material.dart';

// ***********************************
//
//  ElevatedButton
//
// ***********************************

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
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
      appBar: AppBar(title: const Text('ElevatedButton'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ElevatedButton - Estrutura Mínima
            ElevatedButton(child: const Text('Botão 01'), onPressed: () {}),

            // ElevatedButton - Estrutura Mínima - Desabilitado
            const ElevatedButton(onPressed: null, child: Text('Botão 02')),

            // ElevatedButton - Simples
            ElevatedButton(
              child: const Text(
                'Botão 03',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 22,
                ),
              ),

              // Primeira forma de chamar a função
              /*
              onPressed: () {
                print('>>>>>>>>>>>> Botão Clicado!');
              },
              */
              // Segunda forma de chamar a função
              // onPressed: () => _onClickEnviar(),

              // Terceira forma de chamar a função
              // somente se não precisar enviar parâmetros
              onPressed: _onClickEnviar,
            ),

            // ElevatedButton - Com ícone
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text(
                'Botão 04',
                style: TextStyle(fontSize: 22),
              ),
            ),

            // ElevatedButton - Com ícone à direita
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(8),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: SizedBox(
                width: 300,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Botão 05'),
                    SizedBox(width: 8),
                    Icon(Icons.save),
                  ],
                ),
              ),
            ),

            // ElevatedButton com style
            ElevatedButton(
              child: const Text('Botão 06'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  primary: Colors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            // ElevatedButton com style e bordas arredondadas
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(255, 255, 255, 0.8), // background
                onPrimary: Colors.purple, // foreground
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.purple, width: 2),
                ),
              ),
              child: const Text('Botão 07'),
            ),

            // ElevatedButton com ButtonStyle
            ElevatedButton(
              child: const Text('Botão 08'),
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 20))),
            ),
          ],
        ),
      ),
    );
  }

  void _onClickEnviar() {
    print('>>>>>>>>>>>> Botão Clicado!');
  }
}
