import 'package:aroundix_store/common/model/abstract_user.dart';

import '../../../product/domain/entities/Product.dart';

class UserInfo extends User {
  List<Product>? products;

  UserInfo(
      {required super.v,
      required super.id,
      required super.createdAt,
      required super.email,
      required super.fullName,
      required super.password,
      required this.products,
      required super.updatedAt});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      v: json['__v'],
      id: json['_id'],
      createdAt: json['createdAt'],
      email: json['email'],
      fullName: json['fullName'],
      password: json['password'],
      products: json['products'] != null
          ? (json['products'] as List).map((i) => Product.fromJson(i)).toList()
          : null,
      updatedAt: json['updatedAt'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__v'] = v;
    data['_id'] = id;
    data['createdAt'] = createdAt;
    data['email'] = email;
    data['fullName'] = fullName;
    data['password'] = password;
    data['updatedAt'] = updatedAt;
    if (products != null) {
      data['products'] = products?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
