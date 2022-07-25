import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_ur_app/models/product_model.dart';
import 'package:test_ur_app/services/product_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    final productService = ProductService();

    on<ProductEvent>((event, emit) async {
      try {
        emit(ProductLoading());
        final data = await productService.fetchProducts();
        emit(ProductLoaded(data));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
