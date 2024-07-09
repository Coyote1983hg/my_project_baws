import 'clothing_Item.dart';
import 'customer.dart';

class Order {
  final String id;
  final List<ClothingItem> items;
  final Customer customer;
  final double total;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.items,
    required this.customer,
    required this.total,
    DateTime? createdAt,
  }) : this.createdAt = createdAt ?? DateTime.now();

  // Metoda factory pentru crearea unui Order dintr-un Map
  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as String,
      items: (map['items'] as List<dynamic>)
          .map((item) => ClothingItem.fromMap(item as Map<String, dynamic>))
          .toList(),
      customer: Customer.fromMap(map['customer'] as Map<String, dynamic>),
      total: (map['total'] as num).toDouble(),
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  // Metoda pentru convertirea unui Order într-un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'items': items.map((item) => item.toMap()).toList(),
      'customer': customer.toMap(),
      'total': total,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
