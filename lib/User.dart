
import 'domain/ShoppingCart.dart';


import 'domain/ClothingItem.dart';
// Order Manager class



// class User
class User {
  final String id;
  final String name;
  final ShoppingCart cart;

  User({
    required this.id,
    required this.name,
    required this.cart,
  });

  void addClothingToBasket(ClothingItem clothing) {
    cart.addItem(clothing);
  }
}