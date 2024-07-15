import 'package:shopping_application/model/cart_item_model.dart';
import 'package:shopping_application/model/games.dart';

abstract class IController {
  void addGame(Games game);

  void removeGame(CartItemModel cart);

  void changeGame(int id, int quantity);

  void totalPrice();
}
