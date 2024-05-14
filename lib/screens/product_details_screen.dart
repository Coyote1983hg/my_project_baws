import 'package:flutter/material.dart';
import 'package:my_project_baws/data/mock_database.dart';
import 'package:my_project_baws/domain/ClothingItem.dart';
import 'package:my_project_baws/screens/cart_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  // Attribute
  ClothingItem item;
  MockDatabase mockDB;

  // Konstruktor
  ProductDetailsScreen(this.item, this.mockDB, {super.key});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              item.imagePath,
              fit: BoxFit.cover,
              height: 200.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              item.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              item.description,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              item.color,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              item.price.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                mockDB.addItemToCart(item);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartScreen(mockDB)));
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
