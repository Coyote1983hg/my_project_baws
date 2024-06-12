// Clothing Item class
class ClothingItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String color;
  // TODO: add image as attribute, zb. String path  = 'assets/images/300-00H-4.jpg'
  final String imagePath;
  int quantity;

  ClothingItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.imagePath,
    this.quantity = 1,
  });
}
