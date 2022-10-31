import 'package:flutter/material.dart';

class DadosPage extends StatelessWidget {
  const DadosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Página de Dados",
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
