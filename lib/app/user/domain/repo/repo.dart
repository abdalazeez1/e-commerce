import 'package:aroundix_core/core.dart';
import 'package:aroundix_store/app/user/domain/entities/response_data.dart';

import '../entities/response_user_info.dart';

abstract class IUserRepo {
  Future<ApiResult<ResponseData>> login(Params params);

  Future<ApiResult<ResponseData>> signUp(Params params);

  Future<ApiResult<ResponseUserInfo>> getUserInfo();

  Future<void> logout();

  Stream<ResponseData?> get userStream;

  ResponseData? get user;
}
