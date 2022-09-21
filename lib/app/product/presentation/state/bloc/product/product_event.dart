part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetAllProduct extends ProductEvent {}

class GetProductById extends ProductEvent {
  final String productId;

  GetProductById({required this.productId});
}

class AddProduct extends ProductEvent {
final ParamAddProduct paramAddProduct;

  AddProduct({required this.paramAddProduct});

}

class PopFromDetailProduct extends ProductEvent {}
class ResetAddProduct extends ProductEvent {}
