import 'package:shopping_application/model/games.dart';

class CartItemModel {
  final Games game;
  int quantity;

  CartItemModel({
    required this.game,
    required this.quantity,
  });
}
