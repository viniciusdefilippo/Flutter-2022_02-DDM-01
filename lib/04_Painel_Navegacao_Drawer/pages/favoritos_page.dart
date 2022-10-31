import 'package:flutter/material.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.purple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Página de Favoritos",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Anúncios'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/anuncios");
                  },
                ),
                ElevatedButton(
                  child: const Text('Dados'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/dados");
                  },
                ),
                ElevatedButton(
                  child: const Text('HomePage'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
