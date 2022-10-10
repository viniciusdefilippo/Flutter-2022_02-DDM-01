import 'package:flutter/material.dart';

// ******************************
//
//  ListView com Imagens
//
// ******************************

/* 
 --------------------------------------------
  Roteiro para desenvolvimento deste exemplo:
 --------------------------------------------

 01 - Criar o diretório assets/images na raiz do projeto
 02 - Incluir as imagens desejadas nesse diretório
 03 - Informar no arquivo pubspec.yaml o diretório dessas imagens
  assets:
    - assets/images/
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg
  
  NÃO ESQUECER DE REINICIAR A APLICAÇÃO
  
 04 - Na Classe HomePage, apagar todo o conteúdo da propriedade body: (inclusive o modificador const) e inserir um Widget ListView 
 05 - Inserir uma primeira imagem como filha do ListView utilizando: Image.network('url da imagem', fit: BoxFit.cover),
 06 - url de exemplo: 'https://s2.glbimg.com/YKv2ncmrfH68q-LaVkx93p1-lFE=/0x0:300x400/984x0/smart/filters:strip_icc()/s.glbimg.com/jo/g1/f/original/2012/04/11/simpsons2.jpg'
 
 ATENÇÃO: A inserção de imagens por urls externas por questões de política de segurança não funciona em navegadores. Esta opção só funcionará quando a saída for um dispositivo android conectado via USB
 
 07 - Inserir outras imagens de arquivo como filhas do ListView: Image.asset('assets/images/imagem.png', fit: BoxFit.cover),
 08 - Imagens de exemplo: 
 
	  Image.asset('assets/images/homer.jpg',
		  width: 300, height: 150, fit: BoxFit.fitWidth),
	  Image.asset('assets/images/marge.jpg', fit: BoxFit.cover),
	  Image.asset('assets/images/bart.jpg', fit: BoxFit.cover),
	  Image.asset('assets/images/lisa.png', fit: BoxFit.cover),
	  Image.asset('assets/images/meg.png', fit: BoxFit.cover),
		  
 09 - Explorar as diversas proprieades fit: para verificar como as imagens serão apresentadas 
 
 10 - Reparar que os conteúdos de Image.asset são muito parecidos. Sendo assim, fazer algumas extrações de métodos para componentização, modularização e reaproveitamento do código
 
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
      body: ListView(
        children: [
          // Image.network(
          //     'https://s2.glbimg.com/YKv2ncmrfH68q-LaVkx93p1-lFE=/0x0:300x400/984x0/smart/filters:strip_icc()/s.glbimg.com/jo/g1/f/original/2012/04/11/simpsons2.jpg',
          //     fit: BoxFit.cover),
          Image.asset('assets/images/homer.jpg',
              width: 300, height: 150, fit: BoxFit.fitWidth),
          Image.asset('assets/images/marge.jpg', fit: BoxFit.cover),
          Image.asset('assets/images/bart.jpg', fit: BoxFit.cover),
          Image.asset('assets/images/lisa.png', fit: BoxFit.cover),
          Image.asset('assets/images/meg.png', fit: BoxFit.cover),
        ],
      ),
    );
  }
}
