import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.shopping_cart, color: Colors.black),
        Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
