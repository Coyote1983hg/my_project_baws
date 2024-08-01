import 'package:my_project_baws/src/domain/clothing_Item.dart';
import 'package:my_project_baws/src/domain/user.dart';

abstract class DatabaseRepository {
  late List<ClothingItem> products;
  late List<ClothingItem> cart;

  Future<List<ClothingItem>> getProducts();
  Future<List<ClothingItem>> getCart();
  Future<void> addItemToCart(ClothingItem clothingItem, User user);
  Future<void> removeItemFromCart(ClothingItem clothingItem);
}
