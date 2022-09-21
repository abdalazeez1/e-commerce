import 'package:aroundix_core/core.dart';

import '../domain/entities/response_data.dart';
import '../domain/entities/response_user_info.dart';
import '../domain/repo/repo.dart';

class UserFacade {
  final IUserRepo _userRepo;

  UserFacade({required IUserRepo userRepo}) : _userRepo = userRepo;

  Future<ApiResult<ResponseData>> login(Params params) async {
    return await _userRepo.login(params);
  }

  Future<void> logout() {
    return _userRepo.logout();
  }

  Future<ApiResult<void>> signUp(Params params) {
    return _userRepo.signUp(params);
  }

  Future<ApiResult<ResponseUserInfo>> getUserInfo() {
    return _userRepo.getUserInfo();
  }

  ResponseData? get user => _userRepo.user;

  Stream<ResponseData?> get userStream => _userRepo.userStream;

  ResponseData? get getUser => _userRepo.user;
}
