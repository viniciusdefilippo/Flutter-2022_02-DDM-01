import 'package:app/05_Botton_Navigation_Bar/pages/anuncios_page.dart';
import 'package:app/05_Botton_Navigation_Bar/pages/dados_page.dart';
import 'package:app/05_Botton_Navigation_Bar/pages/favoritos_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _paginaAtual = 0;

  final List<Widget> _paginas = [
    const AnunciosPage(),
    const DadosPage(),
    const FavoritosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Modelo'),
        centerTitle: true,
      ),
      body: Container(
        child: _paginas.elementAt(_paginaAtual),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement), label: 'Anúncios'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Dados'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritos'),
        ],
        currentIndex: _paginaAtual,
        onTap: (int index) {
          setState(() {
            _paginaAtual = index;
          });
        },
      ),
    );
  }
}
