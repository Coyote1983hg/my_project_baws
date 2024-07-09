import 'clothing_Item.dart';
import 'shopping_cart.dart';

class User {
  final String id;
  final String name;
  final int age;
  final ShoppingCart cart;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.cart,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["id"],
      name: map["name"],
      age: map["age"],
      cart: ShoppingCart(), // Assuming ShoppingCart has a default constructor
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      
    };
  }

  void addClothingToBasket(ClothingItem clothing) {
    cart.addItem(clothing);
  }

  void removeClothingFromBasket(ClothingItem clothing) {
    cart.removeItem(clothing);
  }
}
