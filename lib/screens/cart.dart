import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3c/models/product.dart';
import 'package:statemanagement_3c/providers/productprovider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Cart'),
      ),
      body: Consumer<Products>(
        builder: (_, provider, child) {
          var products = provider.items;
          var carts = provider.cart;
          // List<Product> cart = [];
          // for (int i = 0; i < products.length; i++) {
          //   if (products[i].quantity > 0) {
          //     cart.add(products[i]);
          //   }
          // }
          return ListView.builder(
            itemCount: carts.length,
            itemBuilder: (_, index) => Card(
              child: ListTile(
                title: Text(carts[index].nameDesc),
                trailing: Text(carts[index].quantity.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
