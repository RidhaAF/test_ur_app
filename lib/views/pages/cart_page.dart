import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_ur_app/models/product_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      // body: ListView.builder(
      //   itemCount: Product.productList().length,
      //   itemBuilder: (context, index) {
      //     return Row(
      //       children: [
      //         Expanded(
      //           child: ListTile(
      //             leading:
      //                 Image.network(Product.productList()[index].image ?? ''),
      //             title: Text(
      //               Product.productList()[index].name ?? '',
      //               overflow: TextOverflow.ellipsis,
      //               maxLines: 1,
      //             ),
      //             subtitle: Text(
      //               NumberFormat.currency(
      //                 locale: 'id',
      //                 symbol: 'Rp',
      //                 decimalDigits: 0,
      //               ).format(Product.productList()[index].price),
      //             ),
      //           ),
      //         ),
      //         IconButton(
      //           icon: const Icon(Icons.remove),
      //           onPressed: () {
      //             // remove product from cart
      //           },
      //         ),
      //         const Text("1"),
      //         IconButton(
      //           icon: const Icon(Icons.add),
      //           onPressed: () {
      //             // add product to cart
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // ),
    );
  }
}
