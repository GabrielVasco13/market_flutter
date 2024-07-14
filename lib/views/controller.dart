import 'package:flutter/cupertino.dart';
import 'package:shopping_application/interface/iController.dart';
import 'package:shopping_application/model/cart_model.dart';
import 'package:shopping_application/model/games.dart';

class Controller extends ChangeNotifier implements Icontroller {
  final List<cartItem> _cart = [];

  List<cartItem> get cartRead => _cart;
  double total = 0;

  @override
  void addGame(Games game) {
    int index = _cart.indexWhere((element) => element.game.id == game.id);
    if (index != -1) {
      _cart[index].quantity++;
    } else {
      _cart.add(cartItem(game, 1));
    }
    notifyListeners();
  }

  @override
  void changeGame(int id, int quantity) {
    if (id >= 0 && id < _cart.length) {
      _cart[id].quantity = quantity;
      notifyListeners();
    }
  }

  @override
  void removeGame(cartItem cart) {
    int index = _cart.indexOf(cart);
    if (index != -1) {
      _cart.removeAt(index);
      notifyListeners();
    }
  }

  @override
  String totalPrice() {
    total = 0;
    for (var item in _cart) {
      total += item.game.price * item.quantity;
    }
    return total.toStringAsFixed(2).replaceAll('.', ',');
  }
}
