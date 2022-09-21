import 'package:aroundix_store/app/user/domain/entities/response_user_info.dart';
import 'package:aroundix_store/app/user/infrastructrue/model/user_info.dart';

class ResponseUserInfoDTO {
  String message;
  int status;
  UserInfoDTO user;

  ResponseUserInfoDTO(
      {required this.message, required this.status, required this.user});

  static ResponseUserInfoDTO fromJson(Map<String, dynamic> json) {
    return ResponseUserInfoDTO(
      message: json['message'],
      status: json['status'],
      user: UserInfoDTO.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['user'] = user.toJson();
    return data;
  }

  ResponseUserInfo toAppModel() => ResponseUserInfo(
      message: message, status: status, user: user.toAppModel());

  static List<ResponseUserInfo> fromJsonToDomain(List<dynamic> list) =>
      list.map((e) => fromJson(e).toAppModel()).toList();

  static List<ResponseUserInfo> fromModelToDomain(
          List<ResponseUserInfoDTO> list) =>
      list.map((e) => e.toAppModel()).toList();

  static List<ResponseUserInfoDTO> fromJsonToModel(List<dynamic> list) =>
      list.map((e) => fromJson(e)).toList();
}
