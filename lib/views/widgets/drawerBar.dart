import 'package:flutter/material.dart';
import 'package:shopping_application/components/iconText.dart';
import 'package:shopping_application/repository/gamesRepository.dart';

class Drawerbar extends StatelessWidget {
  const Drawerbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          Container(
            color: Colors.red,
            width: double.infinity,
            height: 300,
          ),
          Container(
            color: Colors.green,
            width: double.infinity,
            height: 200,
          ),
        ],
      ),
    );
  }
}
