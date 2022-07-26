import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_ur_app/models/cart_model.dart';
import 'package:test_ur_app/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<Cart> _carts = [];

  void addToCart(Product product) {
    try {
      emit(CartLoading());

      _carts.add(Cart(_carts.length, product, 1));

      emit(AddToCartSuccess(_carts));
    } on Exception catch (e) {
      emit(CartFailed(e.toString()));
    }
  }
}
