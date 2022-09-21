import 'package:aroundix_store/app/product/infrastructrue/model/Product.dart';
import 'package:aroundix_store/app/user/domain/entities/user_info.dart';
import 'package:aroundix_store/common/model/abstract_user.dart';


class UserInfoDTO extends User {
  List<ProductDTO>? products;

  UserInfoDTO(
      {required super.v,
      required super.id,
      required super.createdAt,
      required super.email,
      required super.fullName,
      required super.password,
      required this.products,
      required super.updatedAt});

  static UserInfoDTO fromJson(Map<String, dynamic> json) {
    return UserInfoDTO(
      v: json['__v'],
      id: json['_id'],
      createdAt: json['createdAt'],
      email: json['email'],
      fullName: json['fullName'],
      password: json['password'],
      products: json['products'] != null
          ? ProductDTO.fromJsonToModel(json['products'])
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

  UserInfo toAppModel() => UserInfo(
      v: v,
      id: id,
      createdAt: createdAt,
      email: email,
      fullName: fullName,
      password: password,
      products: ProductDTO.fromModelToDomain(products),
      updatedAt: updatedAt);

  static List<UserInfo> fromJsonToDomain(List<dynamic> list) =>
      list.map((e) => fromJson(e).toAppModel()).toList();

  static List<UserInfo> fromModelToDomain(List<UserInfoDTO> list) =>
      list.map((e) => e.toAppModel()).toList();

  static List<UserInfoDTO> fromJsonToModel(List<dynamic> list) =>
      list.map((e) => fromJson(e)).toList();
}
