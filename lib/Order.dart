import 'src/domain/ClothingItem.dart';
import 'src/domain/customer.dart';
// Order class
class Order {
  final String id;
  final List<ClothingItem> items;
  final Customer customer;
  final double total;
  final DateTime createdAt = DateTime.now();

  Order({
    required this.id,
    required this.items,
    required this.customer,
    required this.total,
  });
}