import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_ur_app/models/product_model.dart';
import 'package:test_ur_app/views/pages/cart_page.dart';
import 'package:test_ur_app/views/pages/product_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test UR App"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Product.productList().length,
        itemBuilder: (context, index) {
          final product = Product.productList()[index];
          return ListTile(
            leading: Image.network(Product.productList()[index].image),
            title: Text(Product.productList()[index].name),
            subtitle: Text(
              NumberFormat.currency(
                locale: 'id',
                symbol: 'Rp',
                decimalDigits: 0,
              ).format(Product.productList()[index].price),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
