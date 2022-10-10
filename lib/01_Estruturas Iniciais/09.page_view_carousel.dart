import 'package:flutter/material.dart';

// **********************************
//
//  PageView e Carousel de Imagens
//
// **********************************

/*
 ATENÇÃO: Este exemplo não funciona com saída para Navegadores.
 Para o correto funcionamento, utilizar como saída um dispositivo android conectado via US
*/

/*
 --------------------------------------------
  Roteiro para desenvolvimento deste exemplo:
 --------------------------------------------

 Para utilizar as imagens deste exemplo, executar passos iniciais do exemplo: 08.list_view.dart

 01 - Na Classe HomePage, apagar todo o conteúdo da propriedade body: (inclusive o modificador const) e inserir um Widget Column
 
 02 - Inserir imagens de arquivo como filhas dessa coluna: 
		  Image.asset('assets/images/homer.jpg', fit: BoxFit.cover),
          Image.asset('assets/images/marge.jpg', fit: BoxFit.cover),
          Image.asset('assets/images/bart.jpg', fit: BoxFit.cover),
          Image.asset('assets/images/lisa.png', fit: BoxFit.cover),
          Image.asset('assets/images/meg.png', fit: BoxFit.cover),
		  
 03 - Observar que aparecerá um sinal de overflow no final da página mostrando que o conteúdo é maior que o tamanho da tela do dispositivo
 
 04 - Para resolver esse problema, precisamos envolver todo o conteúdo da coluna em um SingleChildScrollView, para isso devemos seguir os próximos passos
 
 05 - Inserir um novo SizedBox para se tornar o primeiro filho de column
 
 06 - Inserir um PageView(), como filho desse SizedBox
 
 07 - Incluir todas as imagens agora como filhas (children:) desse PageView
 
 08 - As imagens sumiram!
 
 09 - Para que apareçam é necessário especificar no SizedBox (pai do PageView) uma altura de 350 para seu conteúdo ser apresentado: height: 350, 
 
 10 - Copie todo o conteúdo desse último SizedBox criado e crie mais dois filhos da coluna para ver o resultado de 3 carrousseis totalmente independentes
 
 11 - Envolver a coluna com o SingleChildScrollView
 
 12 - Reparar que os conteúdos de SizedBox são muito parecidos. Sendo assim, fazer algumas extrações de métodos para componentização, modularização e reaproveitamento do código

*/

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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Modelo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: PageView(
                children: [
                  Image.asset('assets/images/homer.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/marge.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/bart.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/lisa.png', fit: BoxFit.cover),
                  Image.asset('assets/images/meg.png', fit: BoxFit.cover),
                ],
              ),
            ),
            SizedBox(
              height: 350,
              child: PageView(
                children: [
                  Image.asset('assets/images/homer.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/marge.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/bart.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/lisa.png', fit: BoxFit.cover),
                  Image.asset('assets/images/meg.png', fit: BoxFit.cover),
                ],
              ),
            ),
            SizedBox(
              height: 350,
              child: PageView(
                children: [
                  Image.asset('assets/images/homer.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/marge.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/bart.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/lisa.png', fit: BoxFit.cover),
                  Image.asset('assets/images/meg.png', fit: BoxFit.cover),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
