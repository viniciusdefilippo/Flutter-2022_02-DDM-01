import 'package:flutter/material.dart';

class AnunciosPage extends StatelessWidget {
  const AnunciosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Página de Anúncios",
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
                  child: const Text('Dados'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/dados");
                  },
                ),
                ElevatedButton(
                  child: const Text('Favoritos'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/favoritos");
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
