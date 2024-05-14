import 'package:flutter/material.dart';
import 'package:my_project_baws/data/mock_database.dart';
import 'package:my_project_baws/screens/cart_screen.dart';
import 'package:my_project_baws/screens/orders_screen.dart';
import 'package:my_project_baws/screens/product_details_screen.dart';
import 'package:my_project_baws/screens/profile_screen.dart';
import 'package:my_project_baws/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  MockDatabase mockDB;
  HomeScreen(this.mockDB);
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('WawBaws'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen(mockDB)));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Orders'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrdersScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: mockDB.products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsScreen(mockDB.products[index], mockDB)));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      mockDB.products[index].imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mockDB.products[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          mockDB.products[index].price.toString(),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 126, 115, 115),
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
      ),
    );
  }
}
