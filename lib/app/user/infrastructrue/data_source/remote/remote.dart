import 'package:aroundix_core/core.dart';
import 'package:aroundix_store/app/user/infrastructrue/model/response_data.dart';
import 'package:aroundix_store/app/user/infrastructrue/model/response_user_info.dart';
import 'package:dio/dio.dart';
import '../../../../../common/const/const.dart';
import '../../../domain/params/login_params.dart';
import '../../../domain/params/sing_up_params.dart';

class UserRemote {
  final Dio _dio;

  UserRemote(this._dio);

  Future<ResponseDataDTO> login(LoginParams loginParams) async {
    return throwAppException(
      () async {
        final response =
            await _dio.post(APIRoutes.account.login, data: loginParams.toMap());
        return ResponseDataDTO.fromJson(response.data);
      },
    );
  }

  Future<ResponseDataDTO> signUp(SignUpParams signUpParams) async {
    return throwAppException(
      () async {
        final response = await _dio.post(APIRoutes.account.signUp,
            data: signUpParams.toMap());
        return ResponseDataDTO.fromJson(response.data);
      },
    );
  }

  Future<ResponseUserInfoDTO> getUserInfo() async {
    return throwAppException(
      () async {
        final response = await _dio.get(APIRoutes.account.getUserInfo);
        return ResponseUserInfoDTO.fromJson(response.data);
      },
    );
  }
}
