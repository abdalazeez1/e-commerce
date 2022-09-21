class ForgetPasswordParam {
  final String code;
  final String email;
  final String password;

  ForgetPasswordParam(
      {required this.code, required this.email, required this.password});

  factory ForgetPasswordParam.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordParam(
      code: json['code'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
