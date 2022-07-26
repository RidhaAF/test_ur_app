part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class AddToCartSuccess extends CartState {
  final List<Cart> cart;

  const AddToCartSuccess(this.cart);

  @override
  List<Object> get props => [cart];
}

class CartFailed extends CartState {
  final String error;

  const CartFailed(this.error);

  @override
  List<Object> get props => [error];
}
