import 'package:flutter/material.dart';

// ***********************************
//
//  Stack e Imagens
//
// ***********************************

/* 
 --------------------------------------------
  Roteiro para desenvolvimento deste exemplo:
 --------------------------------------------
 
  Para utilizar as imagens deste exemplo, executar passos iniciais do exemplo: 08.list_view.dart
 
 01 - Na Classe HomePage, apagar todo o conteúdo da propriedade body: (inclusive o modificador const) e inserir um Widget Column  
 
 02 - Dentro da column, inserir uma row
 
 03 - Como primeiro filho dessa row inserir o texto "A família mais divertida do planeta!",
 
 04 - Alterar os estilos de texto para:  
 style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: Colors.black87)
 
 05 - Com isso o texto vai "estourar" a largura da tela sendo apresentado o alerta de overflow
 
 06 - Para resolver isso inserir inicialmente um container envolvendo o texto para que seja possível alterar algumas propriedades
 
 07 - A seguir envovler esse Containter com o widget Expanded (que vai fazer com que o texto ocupe toda a largura da tela sem causar o overflow) para resolver o problema do overflow do texto
 
 08 - Inserir uma cor de fundo e um padding no container criado com as seguintes configurações: padding: EdgeInsets.all(16), color: Color.fromRGBO(254, 203, 0, 0.7),
 
 09 - Logo depois do texto inserir o alinhamento ao centro: textAlign: TextAlign.center,
 
 10 - Logo abaixo do alinhamento do texto (textAlign) também é possível inserir a quandidade máxima de linhas a serem apresentadas e como deve ser apresentado o overflow utilizando:  maxLines: 1, overflow: TextOverflow.ellipsis,
 
 11 - Envolver a column com o widget Stack. Assim o widget column se tornará o primeiro filho de Stack que pode ter mais de um filho (children)
 
 12 - Vamos agora inserir uma imagem de fundo que irá ocupar toda a tela
 
 13 - Para isso inserir agora como primeiro filho (antes de column): SizedBox.expand que terá como seu filho uma imagem: Image.asset("assets/images/simpsons.jpg", fit: BoxFit.cover,)
 
 14 - Dentro de column, alinhar o texto para o final da tela: mainAxisAlignment: MainAxisAlignment.end,
 
 15 - Criar como primeiro filho de Stack, o seguinte Container para mostrar como funcionam as camadas em Stack: Container(color: Colors.red, child: Center(child: Text('ola'))),
 
 16 - Alterar o posicionamento de inserção deste container criado entre os filhos e depois como últimos elemento de Stack para que seja possível verificar a ordem de visualização das camadas
 
 17 - O primeiro filho está na primeira camada e o último filho está na última camada de apresentação
 
 18 - Extrair métodos para modularizar o código

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
        body: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                "assets/images/simpsons.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: const Color.fromRGBO(254, 203, 0, 0.7),
                        child: const Text(
                            'A família mais divertida do planeta!',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87)),
                      ),
                    ),
                    // Alterar o posicionamento deste container entre os
                    // filhos (children:) de Stack, para constatar como é
                    // possível sobrepor elementos uns sobre os outros
                    Container(
                        color: Colors.red,
                        child: const Center(child: Text('ola'))),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
