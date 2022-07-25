import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_ur_app/bloc/product_bloc.dart';
import 'package:test_ur_app/views/pages/cart_page.dart';
import 'package:test_ur_app/views/pages/product_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductBloc _productBloc = ProductBloc();

  @override
  void initState() {
    _productBloc.add(GetProductList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test UR App"),
        actions: [
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
      body: BlocProvider(
        create: (context) => _productBloc,
        child: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductLoaded) {
                return ListView.builder(
                  itemCount: state.product.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // leading: Image.network(state.product[index].image ?? ''),
                      title: Text(state.product[index].name ?? ''),
                      subtitle: Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp',
                          decimalDigits: 0,
                        ).format(state.product[index].price),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetail(state.product[index]),
                          ),
                        );
                      },
                    );
                  },
                );
              } else if (state is ProductError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
