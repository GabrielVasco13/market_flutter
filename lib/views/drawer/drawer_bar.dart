import 'package:flutter/material.dart';
import 'package:shopping_application/components/icon_text.dart';
import 'package:shopping_application/repository/games_repository.dart';
import 'package:shopping_application/views/widget/quantity_input_widget.dart';
import 'package:shopping_application/views/home_page/controller.dart';

class DrawerBar extends StatefulWidget {
  final Controller cartController;

  const DrawerBar({
    super.key,
    required this.cartController,
  });

  @override
  State<DrawerBar> createState() => _DrawerBarState();
}

class _DrawerBarState extends State<DrawerBar> {
  final GamesRepository gamesRepository = GamesRepository();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          SafeArea(
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 80),
                  const IconText()
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ...widget.cartController.cartRead.map(
                  (item) => Container(
                    padding: const EdgeInsets.all(10),
                    height: 120,
                    child: Card(
                      child: Row(
                        children: [
                          Image.asset(
                            gamesRepository
                                .fetchGames()
                                .firstWhere(
                                    (element) => element.id == item.game.id)
                                .image,
                            width: 85,
                            height: 85,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                gamesRepository
                                    .fetchGames()
                                    .firstWhere(
                                        (element) => element.id == item.game.id)
                                    .name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 52,
                                    width: 52,
                                    child: QuantityInputWidget(
                                      item: item,
                                      cartController: widget.cartController,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                      "${(item.game.price * item.quantity).toStringAsFixed(2)} \$"),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              widget.cartController.removeGame(item);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Price:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Total: ${widget.cartController.totalPrice()} R\$",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
