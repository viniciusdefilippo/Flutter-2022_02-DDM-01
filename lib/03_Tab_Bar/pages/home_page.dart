import 'package:flutter/material.dart';

import 'anuncios_page.dart';
import 'dados_page.dart';
import 'favoritos_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.announcement)),
            Tab(icon: Icon(Icons.cloud)),
            Tab(icon: Icon(Icons.favorite)),
          ]),
        ),
        body: const TabBarView(
          children: [
            AnunciosPage(),
            DadosPage(),
            FavoritosPage(),
          ],
        ),
      ),
    );
  }
}
