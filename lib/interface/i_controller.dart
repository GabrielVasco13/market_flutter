import 'package:shopping_application/model/cart_model.dart';
import 'package:shopping_application/model/games.dart';

abstract class Icontroller {
  void addGame(Games game);

  void removeGame(cartItem cart);

  void changeGame(int id, int quantity);

  void totalPrice();
}
