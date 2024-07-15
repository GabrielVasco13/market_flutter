import 'package:flutter/cupertino.dart';
import 'package:shopping_application/interface/i_controller.dart';
import 'package:shopping_application/model/cart_item_model.dart';
import 'package:shopping_application/model/games.dart';

class Controller extends ChangeNotifier implements IController {
  final List<CartItemModel> _cart = [];

  List<CartItemModel> get cartRead => _cart;

  @override
  void addGame(Games game) {
    int index = _cart.indexWhere((element) => element.game.id == game.id);
    if (index != -1) {
      _cart[index].quantity++;
    } else {
      _cart.add(
        CartItemModel(game: game, quantity: 1),
      );
    }
    notifyListeners();
  }

  @override
  void changeGame(int id, int quantity) {
    CartItemModel? existingItem =
        _cart.firstWhere((cart) => cart.game.id == id);
    if (existingItem.quantity != 0) {
      existingItem.quantity = quantity;
      notifyListeners();
    }
  }

  @override
  void removeGame(CartItemModel cart) {
    int index = _cart.indexOf(cart);
    if (index != -1) {
      _cart.removeAt(index);
      notifyListeners();
    }
  }

  @override
  String totalPrice() {
    double total = 0;
    for (var item in _cart) {
      total += item.game.price * item.quantity;
    }
    return total.toStringAsFixed(2).replaceAll('.', ',');
  }
}
