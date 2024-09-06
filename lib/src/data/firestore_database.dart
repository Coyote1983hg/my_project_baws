import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:my_project_baws/src/domain/clothing_item.dart';
import 'package:my_project_baws/src/domain/user.dart';

import 'database_repository.dart';

class FirestoreDatabase implements DatabaseRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<ClothingItem>> getProducts() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('products').get();
      final products = snapshot.docs
          .map(
              (doc) => ClothingItem.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      return products;
    } catch (e) {
      debugPrint('Error getting products: $e');
      return [];
    }
  }

  @override
  Future<ClothingItem?> getProduct(String productId) async {
    try {
      final doc = await _firestore.collection('products').doc(productId).get();
      final product = ClothingItem.fromMap(doc.data() as Map<String, dynamic>);
      return product;
    } catch (e) {
      debugPrint('Error getting products: $e');
      return null;
    }
  }

  @override
  Future<List<ClothingItem>?> getMultibleProduct(
      List<String> productIds) async {
    try {
      debugPrint("$productIds");
      List<ClothingItem> products = [];
      for (String productId in productIds) {
        final doc =
            await _firestore.collection('products').doc(productId).get();
        final product =
            ClothingItem.fromMap(doc.data() as Map<String, dynamic>);
        products.add(product);
      }

      return products;
    } catch (e) {
      debugPrint('Error getting products: $e');
      return null;
    }
  }

  @override
  Future<List<ClothingItem>> getCart() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('users').get();
      final cart = snapshot.docs
          .map(
              (doc) => ClothingItem.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      return cart;
    } catch (e) {
      debugPrint('Error getting cart: $e');
      return [];
    }
  }

  @override
  Future<void> addItemToCart(ClothingItem clothingItem, User user) async {
    try {
      user.addClothingToBasket(clothingItem);
      await _firestore.collection('users').doc(user.id).update(user.toMap());
    } catch (e) {
      debugPrint('Error adding item to cart: $e');
      rethrow;
    }
  }

  @override
  Future<void> removeItemFromCart(ClothingItem clothingItem) async {
    try {
      await _firestore.collection('cart').doc(clothingItem.id).delete();
    } catch (e) {
      debugPrint('Error removing item from cart: $e');
      rethrow;
    }
  }

  Future<void> addProduct(ClothingItem clothingItem) async {
    try {
      await _firestore
          .collection('products')
          .doc(clothingItem.id)
          .set(clothingItem.toMap());
    } catch (e) {
      debugPrint('Error adding product: $e');
      rethrow;
    }
  }

  Future<void> updateProduct(ClothingItem clothingItem) async {
    try {
      await _firestore
          .collection('products')
          .doc(clothingItem.id)
          .update(clothingItem.toMap());
    } catch (e) {
      debugPrint('Error updating product: $e');
      rethrow;
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await _firestore.collection('products').doc(productId).delete();
    } catch (e) {
      debugPrint('Error deleting product: $e');
      rethrow;
    }
  }
}
