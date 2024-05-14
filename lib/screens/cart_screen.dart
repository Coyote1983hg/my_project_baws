import 'package:flutter/material.dart';
import 'package:my_project_baws/data/mock_database.dart';
import 'package:my_project_baws/screens/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  MockDatabase mockDB;

  CartScreen(this.mockDB);

  

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.mockDB.cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              widget.mockDB.cart[index].imagePath,
              fit: BoxFit.cover,
            ),
            title: Text(widget.mockDB.cart[index].name),
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
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CheckoutScreen()));
          },
          child: const Text('Proceed to Checkout'),
        ),
      ),
    );
  }
}
