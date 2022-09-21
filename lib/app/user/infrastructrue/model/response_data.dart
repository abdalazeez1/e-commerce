import 'package:aroundix_store/app/user/infrastructrue/model/user_impl.dart';

import '../../domain/entities/response_data.dart';

class ResponseDataDTO {
  String token;
  UserImplDTO user;

  ResponseDataDTO({required this.token, required this.user});

  static ResponseDataDTO fromJson(Map<String, dynamic> json) {
    return ResponseDataDTO(
      token: json['token'],
      user:UserImplDTO.fromJson( json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['user'] = user.toJson();
    return data;
  }

  ResponseData toAppModel() =>
      ResponseData(token: token, user: user.toAppModel());

  static List<ResponseData> fromJsonToDomain(List<dynamic> list) =>
      list.map((e) => fromJson(e).toAppModel()).toList();

  static List<ResponseData> fromModelToDomain(List<ResponseDataDTO> list) =>
      list.map((e) => e.toAppModel()).toList();

  static List<ResponseDataDTO> fromJsonToModel(List<dynamic> list) =>
      list.map((e) => fromJson(e)).toList();
}
