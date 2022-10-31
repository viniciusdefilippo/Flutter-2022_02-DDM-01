import 'package:app/04_Painel_Navegacao_Drawer/pages/anuncios_page.dart';
import 'package:app/04_Painel_Navegacao_Drawer/pages/dados_page.dart';
import 'package:app/04_Painel_Navegacao_Drawer/pages/favoritos_page.dart';
import 'package:app/04_Painel_Navegacao_Drawer/pages/home_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes() {
  return {
    '/': (context) => const HomePage(),
    '/anuncios': (context) => const AnunciosPage(),
    '/dados': (context) => const DadosPage(),
    '/favoritos': (context) => const FavoritosPage(),
  };
}
