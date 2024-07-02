class ClothingItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String color;
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

  // Metoda factory pentru crearea unui ClothingItem dintr-un Map
  factory ClothingItem.fromMap(Map<String, dynamic> map) {
    return ClothingItem(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: (map['price'] as num).toDouble(),
      color: map['color'] as String,
      imagePath: map['imagePath'] as String,
      quantity: map['quantity'] as int? ?? 1,
    );
  }

  // Metoda pentru convertirea unui ClothingItem într-un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'color': color,
      'imagePath': imagePath,
      'quantity': quantity,
    };
  }
}
