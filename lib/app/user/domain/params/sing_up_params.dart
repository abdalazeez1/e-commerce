import 'package:aroundix_core/core.dart';

class SignUpParams extends Params {
  final String email;
  final String password;
  final String name;

  SignUpParams({
    required this.name,
    required this.password,
    required this.email,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'fullName': name,
    };
  }

  factory SignUpParams.fromMap(Map<String, dynamic> map) {
    return SignUpParams(
      email: map['email'],
      password: map['password'],
      name: map['fullName'],
    );
  }
}
