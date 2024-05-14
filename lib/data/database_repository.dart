import 'package:my_project_baws/domain/ClothingItem.dart';

abstract class DatabaseRepository {
  List<ClothingItem> getProducts();
  List<ClothingItem> getCart();
  void addItemToCart(ClothingItem clothingItem);
  void removeItemFromCart(ClothingItem clothingItem);
}
