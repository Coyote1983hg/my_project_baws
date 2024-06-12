import 'package:my_project_baws/domain/ClothingItem.dart';

abstract class DatabaseRepository {
  late List<ClothingItem> products;
  late List<ClothingItem> cart;
  Future<List<ClothingItem>> getProducts();
  Future<List<ClothingItem>> getCart();
  Future<void> addItemToCart(ClothingItem clothingItem);
  Future<void> removeItemFromCart(ClothingItem clothingItem);
}
