import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api_bloc/Bloc/event.dart';
import 'package:product_api_bloc/Bloc/state.dart';
import 'package:product_api_bloc/Models/ProductModel.dart';
import 'package:product_api_bloc/api_helper.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiHelper apiHelper;

  ProductBloc({required this.apiHelper}) : super(ProductLoadingState()) {
    // Register the event handler for GetProductEvent
    on<GetProductEvent>(_onGetProductEvent);
  }

  Future<void> _onGetProductEvent(
      GetProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    try {
      final data =
          await apiHelper.getAPI(url: "https://dummyjson.com/products");
      if (data != null) {
        final productModel = ProductModel.fromJson(data);
        emit(ProductLoadedState(resData: productModel));
      } else {
        emit(ProductErrorState(errorMsg: "Failed to fetch products."));
      }
    } catch (e) {
      emit(ProductErrorState(errorMsg: "An error occurred: $e"));
    }
  }
}
