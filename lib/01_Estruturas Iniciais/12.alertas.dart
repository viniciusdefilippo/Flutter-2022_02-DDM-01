import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ********************************
//
//  Alertas: Snack, dialog, toast
//
// ********************************

/* 
 --------------------------------------------
  Roteiro para desenvolvimento deste exemplo:
 --------------------------------------------
 
 O Toast não existe no Flutter por padrão, sendo assim é necessário instalar o plugin
 e registrar no arquivo pubspec.yaml
 https://pub.dev/packages/fluttertoast
 
 ATENÇÃO: No momento de registrar o fluttertoast no arquivo pubspec.yaml, 
 não saltar linhas dentro de dependencies: 
	
 Lembrando que neste caso, após realizados os passos acima, será necessário rodar novamente a aplicação para que a biblioteca seja reconhecida pelo Flutter
 
 --------------------------------------------
  Roteiro para desenvolvimento deste exemplo:
 --------------------------------------------

 01 - Na Classe HomePage, apagar todo o conteúdo da propriedade body: (inclusive o modificador const) e inserir um Widget Column 
 
 02 - Dentro de column inserir uma row
 
 03 - Como filhos de row inserir 3 botões:
		ElevatedButton(onPressed: () {}, child: Text('Botão')),
		
 04 - Alinhar estes três botões na row utilizando a propriedade: mainAxisAlignment: MainAxisAlignment.spaceEvenly,
 
 05 - Alinhar estes três botões verticalmente ao centro da coluna com a proprieade: mainAxisAlignment: MainAxisAlignment.center,
 
 06 - Para que seja possível utilizar os alertas é necessário inserir o contexto da aplicação e consequentemente um buider como primeiro filho de column:
		Builder(builder: (BuildContext inContext) {return Row();},),
		
 07 - Copiar todo o conteúdo da Row original para a nova Row que está vazia dentro do Builder
 
 08 - Apagar a antiga Row que ficou vazia
 
 09 - Alterar os métodos e textos de cada botão da seguinte forma:
		
	  ElevatedButton(
		onPressed: () => _showSnackBar(inContext),
		child: Text('SnackBar'),
	  ),
	  ElevatedButton(
		onPressed: () => _showDialog(inContext),
		child: Text('Dialog'),
	  ),
	  ElevatedButton(
		onPressed: () => _showToast(inContext),
		child: Text('Toast'),
	  ),
 
 10 - Insira os métodos para chamada de cada um dos alertas:
 
	 void _showToast(inContext) {
	  Fluttertoast.showToast(
		msg: 'Mensagem do Toast!',
		gravity: ToastGravity.BOTTOM,
		backgroundColor: Colors.green,
		textColor: Colors.white,
		fontSize: 16.0,
	  );
	}

	void _showDialog(inContext) {
	  showDialog(
		context: inContext,
		// true: fecha o alerta se o usuário clicar em qualquer lugar na tela
		// false: não fecha o alerta se o usuário clicar em qualquer lugar na tela
		barrierDismissible: false,
		builder: (inContext) {
		  return WillPopScope(
		    // true: fecha o alerta se o usuário clicar em voltar
			// false: não fecha o alerta se o usuário clicar em voltar
			onWillPop: () async => false,
			child: AlertDialog(
			  title: Text('Mensagem do Dialog'),
			  actions: [
				TextButton(
				  onPressed: () {
					// Fecha a janela do alerta
					Navigator.pop(inContext);
				  },
				  child: Text('Cancelar'),
				),
				TextButton(
				  onPressed: () {
					// Fecha a janela do alerta
					Navigator.pop(inContext);
				  },
				  child: Text('OK'),
				),
			  ],
			),
		  );
		},
	  );
	}

	void _showSnackBar(inContext) {
	  ScaffoldMessenger.of(inContext).showSnackBar(
		SnackBar(
		  content: Text(
			'Olá Pessoal',
			style: TextStyle(color: Colors.yellow),
		  ),
		  action: SnackBarAction(
			label: 'Eu sou uma snackBar',
			onPressed: () {},
		  ),
		),
	  );
	}
	
 11 - O método void _showToast(inContext) vai dar erro de compilação e para corrigir é necessário importar o Fluttertoast: import 'package:fluttertoast/fluttertoast.dart';

 12 - Analise os códigos inseridos e faça algumas alterações para uma melhor compreensão de cada um dos componentes.
	
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(
              builder: (BuildContext inContext) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () => _showSnackBar(inContext),
                        child: const Text('SnackBar')),
                    ElevatedButton(
                        onPressed: () => _showDialog(inContext),
                        child: const Text('Dialog')),
                    ElevatedButton(
                        onPressed: () => _showToast(inContext),
                        child: const Text('Toast')),
                  ],
                );
              },
            ),
          ],
        ));
  }

  void _showToast(inContext) {
    Fluttertoast.showToast(
      msg: 'Mensagem do Toast!',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _showDialog(inContext) {
    showDialog(
      context: inContext,
      // true: fecha o alerta se o usuário clicar em qualquer lugar na tela
      // false: não fecha o alerta se o usuário clicar em qualquer lugar na tela
      barrierDismissible: false,
      builder: (inContext) {
        return WillPopScope(
          // true: fecha o alerta se o usuário clicar em voltar
          // false: não fecha o alerta se o usuário clicar em voltar
          onWillPop: () async => false,
          child: AlertDialog(
            title: const Text('Mensagem do Dialog'),
            actions: [
              TextButton(
                onPressed: () {
                  // Fecha a janela do alerta
                  Navigator.pop(inContext);
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  // Fecha a janela do alerta
                  Navigator.pop(inContext);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSnackBar(inContext) {
    ScaffoldMessenger.of(inContext).showSnackBar(
      SnackBar(
        content: const Text(
          'Olá Pessoal',
          style: TextStyle(color: Colors.yellow),
        ),
        action: SnackBarAction(
          label: 'Eu sou uma snackBar',
          onPressed: () {},
        ),
      ),
    );
  }
}
