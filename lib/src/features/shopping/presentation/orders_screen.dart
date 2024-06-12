import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              'https://via.placeholder.com/50',
              fit: BoxFit.cover,
            ),
            title: Text('Order #${index + 1}'),
            subtitle: Text('Placed on: 2023-04-22'),
            trailing: Text('EUR19.99'),
          );
        },
      ),
    );
  }
}
