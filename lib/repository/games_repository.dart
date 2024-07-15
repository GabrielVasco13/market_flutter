import 'package:shopping_application/model/games.dart';

class GamesRepository {
  List<Games> fetchGames() {
    return [
      Games(
        id: 1,
        name: "Fifa 23",
        image: "images/fifa.png",
        price: 249.99,
      ),
      Games(
        id: 2,
        name: "GTA V",
        image: "images/gta.png",
        price: 199.99,
      ),
      Games(
        id: 3,
        name: "Ghost of tsushima",
        image: "images/ghost-of-tsushima.png",
        price: 299.99,
      ),
      Games(
        id: 4,
        name: "Watch Dogs",
        image: "images/watch_dogs.png",
        price: 99.99,
      ),
      Games(
        id: 5,
        name: "Fortnite",
        image: "images/fortnite.png",
        price: 99.99,
      ),
    ];
  }
}
