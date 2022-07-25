import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_ur_app/models/product_model.dart';
import 'package:test_ur_app/services/product_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void fetchProducts() async {
    try {
      emit(ProductLoading());

      List<Product> products = await ProductService().fetchProducts();

      emit(ProductSuccess(products));
    } on Exception catch (e) {
      emit(ProductFailed(e.toString()));
    }
  }
}
