import 'package:aroundix_core/core.dart';

import '../../user/api.dart';
import '../../user/domain/entities/response_user_info.dart';

class ProfileFacade {
  final UserApi _userApi;

  ProfileFacade({required UserApi userApi}) : _userApi = userApi;

  Future<ApiResult<ResponseUserInfo>> getUserInfo() {
    return _userApi.getUserInfo();
  }
}
