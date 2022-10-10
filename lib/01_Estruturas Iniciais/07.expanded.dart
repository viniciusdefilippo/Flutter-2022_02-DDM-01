import 'package:flutter/material.dart';

// ***********************************
//
//  Expanded
//
// ***********************************

/* 
 --------------------------------------------
  Roteiro para desenvolvimento deste exemplo:
 --------------------------------------------

 01 - Na Classe HomePage, apagar todo o conteúdo da propriedade body: (inclusive o modificador const) e inserir um Widget Column 
 02 - O primeiro filho da coluna deverá ser um texto de tamanho 22:  Text("Texto 1 Texto 1 Texto 1 Texto 1", style: TextStyle(fontSize: 22)),
 03 - Envolver o compontent Text em um Container e incluir a cor blue neste container
 04 - Copiar esse filho criando outro filho para a coluna (alterar a cor do container desse segundo filho para green)
 05 - Envolver cada container com um Widget Expanded e inserir flex: 3, antes do filho do primeiro container e flex: 7 para o segundo container
 06 - Dentro de style: depois de TextStyle, inlcuir maxLines: 1, overflow: TextOverflow.ellipsis,
 07 - Aumentar a quantidade de texto até "estourar" o campo visual para que apareçam as reticências devido ao overflow do texto
 08 - Alinhar os textos no centro de cada container:  alignment: Alignment.center,
 09 - Trocar Column por Row para ver que o resultado também dará certo só que na largura
 10 - Alterar o maxLines de cada filho da coluna para ver o resultado
 11 - Reparar que os conteúdos de Expanded são muito parecidos. Sendo assim, fazer algumas extrações de métodos para componentização, modularização e reaproveitamento do código

*/

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
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
        body: Column(children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: const Text(
                'Texto 1 Texto 1 Texto 1 Texto 1 Texto 1 Texto 1 Texto 1 Texto 1',
                style: TextStyle(fontSize: 22),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              alignment: Alignment.center,
              color: Colors.green,
              child: const Text(
                'Texto 1 Texto 1 Texto 1 Texto 1 Texto 1 Texto 1 Texto 1 Texto 1',
                style: TextStyle(fontSize: 22),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ]));
  }
}
