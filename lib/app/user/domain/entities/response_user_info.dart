import 'package:aroundix_store/app/user/domain/entities/user_info.dart';

class ResponseUserInfo {
  String message;
  int status;
  UserInfo user;

  ResponseUserInfo(
      {required this.message, required this.status, required this.user});

  factory ResponseUserInfo.fromJson(Map<String, dynamic> json) {
    return ResponseUserInfo(
      message: json['message'],
      status: json['status'],
      user: UserInfo.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['user'] = user.toJson();
    return data;
  }
}
