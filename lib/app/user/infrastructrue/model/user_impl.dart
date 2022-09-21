import '../../../../common/model/abstract_user.dart';
import '../../domain/entities/user_impl.dart';

class UserImplDTO extends User {
  final List<String>? products;

  UserImplDTO(
      {required super.v,
      required super.id,
      required super.createdAt,
      required super.email,
      required super.fullName,
      required super.password,
      required this.products,
      required super.updatedAt});

  static UserImplDTO fromJson(Map<String, dynamic> json) {
    return UserImplDTO(
      v: json['__v'],
      id: json['_id'],
      createdAt: json['createdAt'],
      email: json['email'],
      fullName: json['fullName'],
      password: json['password'],
      products:
          json['pros'] != null ? List<String>.from(json['products']) : null,
      updatedAt: json['updatedAt'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    {
      Map<String, dynamic> data = <String, dynamic>{};
      data['__v'] = v;
      data['_id'] = id;
      data['createdAt'] = createdAt;
      data['email'] = email;
      data['fullName'] = fullName;
      data['password'] = password;
      data['updatedAt'] = updatedAt;
      if (products != null) {
        data['products'] = products;
      }
      return data;
    }
  }

  UserImpl toAppModel() => UserImpl(
      v: v,
      id: id,
      createdAt: createdAt,
      email: email,
      fullName: fullName,
      password: password,
      products: products,
      updatedAt: updatedAt);

  static List<UserImpl> fromJsonToDomain(List<dynamic> list) =>
      list.map((e) => fromJson(e).toAppModel()).toList();

  static List<UserImpl> fromModelToDomain(List<UserImplDTO> list) =>
      list.map((e) => e.toAppModel()).toList();

  static List<UserImplDTO> fromJsonToModel(List<dynamic> list) =>
      list.map((e) => fromJson(e)).toList();
}
