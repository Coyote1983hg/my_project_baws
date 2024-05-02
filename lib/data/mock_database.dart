import '../InventoryManager.dart';
import 'database_repository.dart';
import '../domain/ClothingItem.dart';
import '../User.dart';
import '../domain/ShoppingCart.dart';

class MockDatabase implements DatabaseRepository {}

void main() {
  final inventoryManager = InventoryManager();

  // Add 5 men's boxer shorts
  _addBoxerShorts(inventoryManager);

  // Get all clothing items
  final allClothing = inventoryManager.getAllClothing();
  _printAllClothing(allClothing);

  // Create a user and add an item to their shopping cart
  final user = _createUser();
  final boxerShorts = inventoryManager.getItem('1')!;
  user.addClothingToBasket(boxerShorts);
  _printUserCart(user.cart);
}

void _addBoxerShorts(InventoryManager inventoryManager) {
  inventoryManager.addItem(ClothingItem(
    id: '1',
    name: 'Men\'s Boxer Shorts',
    description: 'Comfortable cotton boxer shorts',
    price: 19.99,
    color: 'Black',
  ));
  inventoryManager.addItem(ClothingItem(
    id: '2',
    name: 'Men\'s Boxer Shorts',
    description: 'Comfortable cotton boxer shorts',
    price: 19.99,
    color: 'White',
  ));
  inventoryManager.addItem(ClothingItem(
    id: '3',
    name: 'Men\'s Boxer Shorts',
    description: 'Comfortable cotton boxer shorts',
    price: 19.99,
    color: 'Blue',
  ));
  inventoryManager.addItem(ClothingItem(
    id: '4',
    name: 'Men\'s Boxer Shorts',
    description: 'Comfortable cotton boxer shorts',
    price: 19.99,
    color: 'Red',
  ));
  inventoryManager.addItem(ClothingItem(
    id: '5',
    name: 'Men\'s Boxer Shorts',
    description: 'Comfortable cotton boxer shorts',
    price: 19.99,
    color: 'Green',
  ));
}

void _printAllClothing(List<ClothingItem> allClothing) {
  print('All clothing items:');
  for (final item in allClothing) {
    print('- ${item.name} (${item.price} Eur, Color: ${item.color})');
  }
}

User _createUser() {
  return User(
    id: '1',
    name: 'John Doe',
    cart: ShoppingCart(),
  );
}

void _printUserCart(ShoppingCart cart) {
  print('\nUser\'s shopping cart:');
  for (final item in cart.items) {
    print('- ${item.name} (${item.price} Eur, Color: ${item.color})');
  }
}
