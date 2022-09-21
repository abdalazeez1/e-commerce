import 'package:aroundix_core/core.dart';
import 'package:aroundix_store/app/user/domain/entities/response_data.dart';
import 'application/facade.dart';
import 'domain/entities/response_user_info.dart';

class UserApi {
  final UserFacade _userFacade;

  UserApi({required UserFacade userFacade}) : _userFacade = userFacade;

  ResponseData? get getUser => _userFacade.getUser;

  Future<ApiResult<ResponseUserInfo>> getUserInfo() {
    return _userFacade.getUserInfo();
  }
}
