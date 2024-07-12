import 'package:flutter/material.dart';
import 'package:shopping_application/repository/gamesRepository.dart';
import 'package:shopping_application/views/widgets/drawerBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final games = Gamesrepository();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xurxo Dev'),
        backgroundColor: Colors.blue,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: const Drawerbar(),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (1 / 1.2),
              shrinkWrap: true,
              children: [
                for (var game in games.games)
                  Card(
                    child: Column(
                      children: [
                        Image.asset(
                          game.image,
                          width: 140,
                          height: 140,
                        ),
                        Text(
                          game.name,
                        ),
                        Text(
                          game.price.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Buy now"),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
