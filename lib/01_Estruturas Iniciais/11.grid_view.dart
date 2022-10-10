import 'package:flutter/material.dart';

// ******************************
//
//  GridView
//
// ******************************

/*
 --------------------------------------------
  Roteiro para desenvolvimento deste exemplo:
 --------------------------------------------

  Para utilizar as imagens deste exemplo, executar passos iniciais do exemplo: 08.list_view.dart


  01 - No início do cógido após o método main() definir a classe Img

  class Img {
    String nome;
    String path;

    Img(this.nome, this.path);
  }

  02 - Na Classe HomePage, no início do método Widget build(BuildContext context), inserir a seguinte lista de objetos da classe Img:
  
  List<Img> imgs = [
      Img("Homer Simpson", "assets/images/homer.jpg"),
      Img("Marge Simpson", "assets/images/marge.jpg"),
      Img("Bart Simpson", "assets/images/bart.jpg"),
      Img("Lisa Simpson", "assets/images/lisa.png"),
      Img("Meg Simpson", "assets/images/meg.png"),
      Img("Homer Simpson", "assets/images/homer.jpg"),
      Img("Marge Simpson", "assets/images/marge.jpg"),
      Img("Bart Simpson", "assets/images/bart.jpg"),
      Img("Lisa Simpson", "assets/images/lisa.png"),
      Img("Meg Simpson", "assets/images/meg.png"),
      Img("Homer Simpson", "assets/images/homer.jpg"),
      Img("Marge Simpson", "assets/images/marge.jpg"),
      Img("Bart Simpson", "assets/images/bart.jpg"),
      Img("Lisa Simpson", "assets/images/lisa.png"),
      Img("Meg Simpson", "assets/images/meg.png"),
      Img("Homer Simpson", "assets/images/homer.jpg"),
      Img("Marge Simpson", "assets/images/marge.jpg"),
      Img("Bart Simpson", "assets/images/bart.jpg"),
    ];
  
  Importante lembrar que essa lista em uma aplicação real, provavelmente seria obtida dinamicamente por exemplo através de um repositório online ou uma Api
  
  03 - Na Classe HomePage, apagar todo o conteúdo da propriedade body: (inclusive o modificador const) e inserir um Widget GridView.builder
  
  04 - Inserir dentro do GridView as propriedades: 
      // crossAxisCount: altera a quantidade de imagens por linha
      // se colocar 1 ficará igual ao ListView
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: imgs.length,
      // o itemBuilder percorre item por item nelo contido 
      // transformando um a um em widgets
      itemBuilder: (context, index) {}

  05 - Incluir o seguinte dentro de itemBuilder:
      Img img = imgs[index];
      // antes do retorno do método, cada imagem é forçada a se encaixar no espaço 
      // a ela destinado em BoxFit.cover
      Image imagemFormatada = Image.asset(img.path, fit: BoxFit.cover);
  
  O itemBuilder serve para percorrer a lista de imagens transformando uma a uma em widgets Img img = imgs[index];

  06 - Observar que o compilador está reclamando da falta do retorno do itemBuilder. Sendo assim acrescentar:  return Stack()  para servir de retorno do itemBuilder e parar a mensagem de erro

  07 - Como primeiro parâmetro de Stack inserir: fit: StackFit.expand, para que as imagens se ajustem ao conteúdo
  
  08 - Como primeiro filho de Stack inserir a variável: imagemFormatada 
  
  09 - Como segundo filho de Stack vamos inserir legendas para as imagens
  
  10 - Inserir um container como segundo filho de Stack
  
  11 - Como filho desse container inserir o texto com as seguines características:
  child: Text('legenda', style: TextStyle(fontSize: 16, color: Colors.white,),),
  
  12 - Como propriedade de container: alignment: Alignment.bottomCenter,
  
  13 - Como surgiram problemas de contraste entre a imagem e o texto, envolver o texto com outro container
  
  14 - Como propriedades desse último container criado inserir:
  decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(16),),
  
  15 - Apesar de ter melhorado o contraste, preciamos aumentar um pouco a caixa de texto
  
  16 - Incluir nesse container as propriedades:  margin: EdgeInsets.all(12), padding: EdgeInsets.all(8),
  
  17 - Precisamos agora trocar os textos das legendas
  
  18 - Substituir o texto 'legenda' por img.nome (atributo da classe Img). Repare que o Text agora não pode ser const
  
  19 - Alterar o valor de crossAxisCount: para verificar a quantidade de imagens por linha no grid
  
  20 - Extrair métodos para modularizar o código

*/

main() => runApp(const MyApp());

class Img {
  String nome;
  String path;

  Img(this.nome, this.path);
}

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
    List<Img> imgs = [
      Img("Homer Simpson", "assets/images/homer.jpg"),
      Img("Marge Simpson", "assets/images/marge.jpg"),
      Img("Bart Simpson", "assets/images/bart.jpg"),
      Img("Lisa Simpson", "assets/images/lisa.png"),
      Img("Meg Simpson", "assets/images/meg.png"),
      Img("Homer Simpson", "assets/images/homer.jpg"),
      Img("Marge Simpson", "assets/images/marge.jpg"),
      Img("Bart Simpson", "assets/images/bart.jpg"),
      Img("Lisa Simpson", "assets/images/lisa.png"),
      Img("Meg Simpson", "assets/images/meg.png"),
      Img("Homer Simpson", "assets/images/homer.jpg"),
      Img("Marge Simpson", "assets/images/marge.jpg"),
      Img("Bart Simpson", "assets/images/bart.jpg"),
      Img("Lisa Simpson", "assets/images/lisa.png"),
      Img("Meg Simpson", "assets/images/meg.png"),
      Img("Homer Simpson", "assets/images/homer.jpg"),
      Img("Marge Simpson", "assets/images/marge.jpg"),
      Img("Bart Simpson", "assets/images/bart.jpg"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Modelo'),
        centerTitle: true,
      ),
      body: GridView.builder(
          // crossAxisCount: altera a quantidade de imagens por linha
          // se colocar 1 ficará igual ao ListView
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: imgs.length,
          // o itemBuilder percorre item por item nelo contido
          // transformando um a um em widgets
          itemBuilder: (context, index) {
            Img img = imgs[index];
            // antes do retorno do método, cada imagem é forçada a se encaixar no espaço
            // a ela destinado em BoxFit.cover
            Image imagemFormatada = Image.asset(img.path, fit: BoxFit.cover);
            return Stack(
              fit: StackFit.expand,
              children: [
                imagemFormatada,
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      img.nome,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
