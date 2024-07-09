import 'dart:core';
import 'product.dart';

class Cart {
  final String id;
  final List<Product> items;
  final double totalPrice;

  Cart({
    required this.id,
    required this.items,
    required this.totalPrice,
  });

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map["id"],
      items: (map["items"] as List<dynamic>)
          .map((item) => Product.fromMap(item as Map<String, dynamic>))
          .toList(),
      totalPrice: map["totalPrice"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'items': items.map((item) => item.toMap()).toList(),
      'totalPrice': totalPrice,
    };
  }
}
