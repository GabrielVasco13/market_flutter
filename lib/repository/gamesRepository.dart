import 'package:shopping_application/model/games.dart';

class Gamesrepository {
  List<Games> games = [
    Games(
      name: "Fifa 23",
      image: "images/fifa.png",
      price: 249.99,
    ),
    Games(
      name: "GTA V",
      image: "images/gta.png",
      price: 199.99,
    ),
    Games(
      name: "Ghost of tsushima",
      image: "images/ghost-of-tsushima.png",
      price: 299.99,
    ),
    Games(
      name: "Watch Dogs",
      image: "images/watch_dogs.png",
      price: 99.99,
    ),
    Games(
      name: "Fortnite",
      image: "images/fortnite.png",
      price: 99.99,
    ),
  ];
}
