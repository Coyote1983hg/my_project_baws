
// Clothing Item class
class ClothingItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String color;
  int quantity;

  ClothingItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    this.quantity = 1,
  });
}