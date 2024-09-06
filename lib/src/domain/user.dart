import 'package:flutter/foundation.dart';
import 'package:my_project_baws/src/domain/clothing_item.dart';

class User {
  final String id;
  final String name;
  final int age;
  final List<String> cartIdList;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.cartIdList,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    debugPrint(map["cart"][0] as String);
    return User(
      id: map["id"],
      name: map["name"],
      age: map["age"],
      cartIdList: map["cart"] == null ? [] : List<String>.from(map["cart"]),
      // Assuming ShoppingCart has a default constructor
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'cart': cartIdList,
    };
  }

  void addClothingToBasket(ClothingItem clothing) {
    cartIdList.add(clothing.id);
  }

  void removeClothingFromBasket(ClothingItem clothing) {
    cartIdList.remove(clothing.id);
  }
}
