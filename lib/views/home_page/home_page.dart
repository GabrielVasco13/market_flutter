import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/model/games.dart';
import 'package:shopping_application/repository/games_repository.dart';
import 'package:shopping_application/views/home_page/controller.dart';

import '../drawer/drawer_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<Controller>(context);
    List<Games> gameList = Gamesrepository().fetchGames();

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
      endDrawer: Drawerbar(
        cartController: cartController,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (1 / 1.2),
              shrinkWrap: true,
              children: [
                for (var game in gameList)
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
                          onPressed: () {
                            Provider.of<Controller>(context, listen: false)
                                .addGame(game);
                          },
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
