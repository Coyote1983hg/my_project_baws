import '../InventoryManager.dart';
import 'database_repository.dart';
import '../domain/ClothingItem.dart';
import '../User.dart';
import '../domain/ShoppingCart.dart';

class MockDatabase implements DatabaseRepository {
// mockdaten kommt irgendwann von der DB zurueck
  List<ClothingItem> products = [
    ClothingItem(
      id: '1',
      name: 'Giorgio\'s Boxer Shorts',
      description: 'Comfortable cotton boxer shorts!',
      price: 19.99,
      color: 'Green',
      imagePath: 'assets/images/310-00H-5.png',
    ),
    ClothingItem(
      id: '2',
      name: 'Giorgio\'s Boxer Shorts',
      description: 'Comfortable cotton boxer shorts!',
      price: 19.99,
      color: 'Light Blue',
      imagePath: 'assets/images/305-00H-4.png',
    ),
    ClothingItem(
      id: '3',
      name: 'Giorgio\'s Boxer Shorts',
      description: 'Comfortable cotton boxer shorts!',
      price: 19.99,
      color: 'Dark Blue',
      imagePath: 'assets/images/310-00H-6.png',
    ),
    ClothingItem(
      id: '4',
      name: 'Giorgio\'s Boxer Shorts',
      description: 'Comfortable cotton boxer shorts!',
      price: 19.99,
      color: 'RED',
      imagePath: 'assets/images/900-00H-5123.png',
    ),
    ClothingItem(
      id: '5',
      name: 'Giorgio\'s Boxer Shorts',
      description: 'Comfortable cotton boxer shorts!',
      price: 19.99,
      color: 'Blue',
      imagePath: 'assets/images/210-00H-2037.png',
    ),
    ClothingItem(
      id: '6',
      name: 'Giorgio\'s Boxer Shorts',
      description: 'Comfortable cotton boxer shorts!',
      price: 19.99,
      color: 'Blue',
      imagePath: 'assets/images/210-00H-2038.png',
    ),
    ClothingItem(
      id: '7',
      name: 'Giorgio\'s Boxer Shorts',
      description: 'Comfortable cotton boxer shorts!',
      price: 19.99,
      color: 'Blue',
      imagePath: 'assets/images/310-00H-2.png',
    ),
    ClothingItem(
      id: '8',
      name: 'Giorgio\'s Boxer Shorts',
      description: 'Comfortable cotton boxer shorts!',
      price: 19.99,
      color: 'Blue',
      imagePath: 'assets/images/305-00H-6.png',
    )
  ];
  // TODO: Als map schreiben
  List<ClothingItem> cart = [];
// mockfunktionen
  @override
  List<ClothingItem> getProducts() {
    return products;
  }

  @override
  List<ClothingItem> getCart() {
    return cart;
  }

  @override
  void addItemToCart(ClothingItem clothingItem) {
    // zu cart liste hinzufuegen
    cart.add(clothingItem);
  }

  @override
  void removeItemFromCart(ClothingItem clothingItem) {
    // zu cart liste entfernen
    cart.remove(clothingItem);
  }
}

