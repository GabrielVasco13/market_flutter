import 'package:flutter/material.dart';
import 'package:shopping_application/components/iconText.dart';
import 'package:shopping_application/repository/gamesRepository.dart';
import 'package:shopping_application/views/controller.dart';

class Drawerbar extends StatefulWidget {
  final Controller cartController;

  const Drawerbar({
    super.key,
    required this.cartController,
  });

  @override
  State<Drawerbar> createState() => _DrawerbarState();
}

class _DrawerbarState extends State<Drawerbar> {
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
                  const Icontext()
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
                    height: 100,
                    child: Row(
                      children: [
                        Image.asset(
                          Gamesrepository()
                              .fetchGames()
                              .firstWhere(
                                  (element) => element.id == item.game.id)
                              .image,
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Gamesrepository()
                                  .fetchGames()
                                  .firstWhere(
                                      (element) => element.id == item.game.id)
                                  .name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Quantity: ${item.quantity}"),
                            Text(
                                "Price: ${item.game.price * item.quantity} \$"),
                          ],
                        ),
                        const Spacer(),
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
