import 'user_impl.dart';

class ResponseData {
  String token;
  UserImpl user;

  ResponseData(
      {
      required this.token,
      required this.user});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      token: json['token'],
      user: UserImpl.fromJson(json['user']) ,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['user'] = user.toJson();
    return data;
  }
}
