import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_ur_app/cubit/cart_cubit.dart';
import 'package:test_ur_app/models/product_model.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
      ),
      body: ListView(
        children: [
          CarouselSlider.builder(
            itemCount: product.images?.length,
            itemBuilder: ((context, index, realIndex) {
              return Image.network(product.images?[index] ?? '');
            }),
            options: CarouselOptions(
              aspectRatio: 1 / 1,
              viewportFraction: 1,
              enableInfiniteScroll: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  NumberFormat.currency(
                    locale: 'id',
                    symbol: 'Rp',
                    decimalDigits: 0,
                  ).format(product.price),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.name ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                product.variant == "1"
                    ? const Text(
                        "Produk ini memiliki varian",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return ElevatedButton(
                  child: const Text("+ Add to Cart"),
                  onPressed: () {
                    context.read<CartCubit>().addToCart(product);
                    if (state is AddToCartSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "Added to cart",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
