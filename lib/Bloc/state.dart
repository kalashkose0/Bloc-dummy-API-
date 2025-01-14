import 'package:product_api_bloc/Models/ProductModel.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}
class ProductLoadingState extends ProductState {}
class ProductLoadedState extends ProductState {
  ProductModel resData;
  ProductLoadedState({required this.resData});
}
class ProductErrorState extends ProductState {
  String errorMsg;
  ProductErrorState({required this.errorMsg});
}