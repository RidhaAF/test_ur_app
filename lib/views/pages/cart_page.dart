import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_ur_app/cubit/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AddToCartSuccess) {
            return ListView.builder(
              itemCount: state.cart.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: Image.network(
                            state.cart[index].product?.images?[0] ?? ''),
                        title: Text(
                          state.cart[index].product?.name ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'Rp',
                            decimalDigits: 0,
                          ).format(state.cart[index].product?.price ?? 0),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
          return const Center(child: Text("Cart is empty"));
        },
      ),
    );
  }
}
