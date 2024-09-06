import 'package:flutter/material.dart';
import 'package:my_project_baws/src/data/auth_repository.dart';
import 'package:my_project_baws/src/data/database_repository.dart';
import 'package:my_project_baws/src/data/user_repository.dart';
import 'package:my_project_baws/src/domain/clothing_Item.dart';
import 'package:my_project_baws/src/domain/user.dart';
import 'package:my_project_baws/src/features/shopping/presentation/checkout_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  CartScreenState createState() => CartScreenState();
}

Future<List<ClothingItem>?> getProducts(BuildContext context) async {
  final currentUserId = context.read<AuthRepository>().getCurrentUser()!.uid;
  User? user =
      await context.read<UserRepository>().getUserFromFirestore(currentUserId);
  return context
      .read<DatabaseRepository>()
      .getMultibleProduct(user!.cartIdList);
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: FutureBuilder(
          future: getProducts(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ClothingItem> products = snapshot.data!;
              debugPrint("Producte im catt $products");
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      products[index].imagePath,
                      fit: BoxFit.cover,
                    ),
                    title: Text(products[index].name),
                    // subtitle: Text('EUR${cart[index]['price'].toStringAsFixed(2)}'),
                    // trailing: Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     IconButton(
                    //       icon: Icon(Icons.remove),
                    //       onPressed: () {
                    //         setState(() {
                    //           if (cart[index]['quantity'] > 1) {
                    //             cart[index]['quantity']--;
                    //           }
                    //         });
                    //       },
                    //     ),
                    //     Text('${cart[index]['quantity']}'),
                    //     IconButton(
                    //       icon: Icon(Icons.add),
                    //       onPressed: () {
                    //         setState(() {
                    //           cart[index]['quantity']++;
                    //         });
                    //       },
                    //     ),
                    //   ],
                    // ),
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CheckoutScreen()));
          },
          child: const Text('Proceed to Checkout'),
        ),
      ),
    );
  }
}
