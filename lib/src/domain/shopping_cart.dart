import 'clothing_Item.dart';

class ShoppingCart {
  final List<ClothingItem> items = [];

  void addItem(ClothingItem item) {
    final existingItem = _getExistingItem(item.id);
    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      items.add(item);
    }
  }

  List<String> getAllItemIds() {
    return items.map((item) => item.id).toList();
  }

  void removeItem(ClothingItem item) {
    items.remove(item);
  }

  double get total => _calculateTotal();

  ClothingItem? _getExistingItem(String itemId) {
    return items.where((i) => i.id == itemId).isEmpty
        ? null
        : items.firstWhere((i) => i.id == itemId);
  }

  double _calculateTotal() {
    return items.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }
}
