import '../../../../common/model/abstract_user.dart';

class UserImpl extends User {
  final List<String>? products;

  UserImpl(
      {required super.v,
      required super.id,
      required super.createdAt,
      required super.email,
      required super.fullName,
      required super.password,
      required this.products,
      required super.updatedAt});

  static UserImpl fromJson(Map<String, dynamic> json) {
    return UserImpl(
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
}
