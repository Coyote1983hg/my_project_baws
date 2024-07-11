import 'package:flutter/material.dart';
import 'package:my_project_baws/src/data/user_repository.dart';
import 'package:my_project_baws/src/domain/clothing_Item.dart';
import 'package:my_project_baws/src/features/profilesettings/presentation/profile_screen.dart';
import 'package:my_project_baws/src/features/profilesettings/presentation/settings_screen.dart';
import 'package:my_project_baws/src/features/shopping/cart_screen.dart';
import 'package:my_project_baws/src/features/shopping/presentation/orders_screen.dart';
import 'package:my_project_baws/src/features/shopping/presentation/product_details_screen.dart';
import 'package:provider/provider.dart';

import '../../../data/database_repository.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<String> productImages = [
    'assets/images/310-00H-5.png',
    'assets/images/305-00H-4.png',
    'assets/images/310-00H-6.png',
    'assets/images/900-00H-5123.png',
    'assets/images/210-00H-2037.png',
    'assets/images/210-00H-2038.png',
    'assets/images/310-00H-2.png',
    'assets/images/305-00H-6.png',
  ];

  @override
  Widget build(BuildContext context) {
    final userRepository = context.read<UserRepository>();
    final databaseRepository = context.read<DatabaseRepository>();
    final user = userRepository.user;

    return Scaffold(
        appBar: AppBar(
          title: const Text('WawBaws'),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: const Text('Orders'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrdersScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsScreen()));
                },
              ),
            ],
          ),
        ),
        body: FutureBuilder(
          future: databaseRepository.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ClothingItem> products = snapshot.data ?? [];
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: databaseRepository.products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                  products[index],
                                  databaseRepository: databaseRepository)));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              products[index].imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  "${products[index].price} EUR",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 126, 115, 115),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
