// Inventory Manager class
import 'package:my_project_baws/src/domain/clothing_item.dart';

class InventoryManager {
  final Map<String, ClothingItem> _inventory = {};

  void addItem(ClothingItem item) {
    _inventory[item.id] = item;
  }

  void updateItemQuantity(String itemId, int newQuantity) {
    if (_inventory.containsKey(itemId)) {
      _inventory[itemId]!.quantity = newQuantity;
    }
  }

  ClothingItem? getItem(String itemId) {
    return _inventory[itemId];
  }

  List<ClothingItem> getAllClothing() {
    return _inventory.values.toList();
  }
}
