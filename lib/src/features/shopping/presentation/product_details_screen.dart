import 'package:flutter/material.dart';
import 'package:my_project_baws/src/data/auth_repository.dart';
import 'package:my_project_baws/src/data/database_repository.dart';
import 'package:my_project_baws/src/data/user_repository.dart';
import 'package:my_project_baws/src/domain/clothing_Item.dart';
import 'package:my_project_baws/src/features/shopping/cart_screen.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  // Attribute
  ClothingItem item;
  final DatabaseRepository databaseRepository;

  // Konstruktor
  ProductDetailsScreen(this.item,
      {super.key, required this.databaseRepository});

  // Methoden
  @override
  Widget build(BuildContext context) {
    final userRepository = context.read<UserRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              item.description,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              item.color,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              '${item.price} EUR',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: ()async {
                final user = context.read<AuthRepository>().getCurrentUser();
                
                if (user != null) {
                  final userInstance = await context.read<UserRepository>().getUserFromFirestore(user.uid);
                  databaseRepository.addItemToCart(item,userInstance!);
                  
                } else {
                  debugPrint("User null Error");
                }

                
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
