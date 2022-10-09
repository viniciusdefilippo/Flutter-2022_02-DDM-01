import 'package:flutter/material.dart';

// *********************************
//
// Texto, Cor RGBA e Cor Hexadecimal
//
// *********************************

/*
 -----------------------------------
 Para Utilizar outro tipo de fonte:
 -----------------------------------
 1 - Escolher e baixar a(s) fonte(s) desejada(s) em:  https://fonts.google.com/
 2 - Criar o diretório assets/fonts na raiz do projeto
 3 - Como exemplo: https://fonts.google.com/specimen/Montserrat
 4 - Declarar a fonte no arquivo pubspec.yaml:

 fonts:
    - family: Montserrat
      fonts:
        - asset: assets/fonts/Montserrat-Black.ttf
        - asset: assets/fonts/Montserrat-Thin.ttf
        - asset: assets/fonts/Montserrat-ExtraBold.ttf
  #    - family: Schyler
  #      fonts:
  #        - asset: fonts/Schyler-Regular.ttf
  #        - asset: fonts/Schyler-Italic.ttf
  #          style: italic
  #    - family: Trajan Pro
  #      fonts:
  #        - asset: fonts/TrajanPro.ttf
  #        - asset: fonts/TrajanPro_Bold.ttf
  #          weight: 700
  #

 As variações da fonte podem ser feitas alterando o peso das fontes com por exemplo:
 fontWeight: FontWeight.w100,

*/
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
        title: const Text('Text & Colors'),
        centerTitle: true,
      ),
      body: Container(
        // Exemplo de cor utilizando RGB e Opacidade
        // Os valores de opacidade devem variar de 0.0 até 1.0
        // sendo a cor: 0 transparente e 1 totalmente sólida
        color: const Color.fromRGBO(139, 0, 139, 0.2),
        child: const Center(
          child: Text(
            'Olá Pessoal',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.overline,
              decorationColor: Colors.blue,
              decorationStyle: TextDecorationStyle.wavy,
              decorationThickness: 2,
              // Exemplo de cor utilizando hexadecimal
              // A classe Color no Flutter aceita somente inteiros como parâmetros
              // Desta forma, é necessário converter a String '#C70039' em um valor inteiro
              // Também é necessário especificar a opacidade
              // A opacidade total é 255 ou FF em hexadecimal
              // A transparência total é 0 ou 00 em hexadecimal
              // Assim para utilizar uma cor em Hexadecimal é necessário concatenar
              // a cor desejada com o prefixo 0x
              color: Color(0xFFC70039),
            ),
          ),
        ),
      ),
    );
  }
}
