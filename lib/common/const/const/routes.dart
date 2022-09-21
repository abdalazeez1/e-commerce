part of '../const.dart';

const kBaseUrl = 'https://aroundix-flutter-test-backend.herokuapp.com/API/';

abstract class APIRoutes {
  APIRoutes._();

  static const account = _Account();

  static const product = _Product();
}

class _Product {
  const _Product();

  final addProduct = 'add-product';
  final getProductById = 'get-product-by-id';
  final getAllProducts = 'get-all-products';
}

class _Account {
  const _Account();

  final login = 'login-user';
  final signUp = 'register-user';
  final getUserInfo = 'get-user-info';
}
