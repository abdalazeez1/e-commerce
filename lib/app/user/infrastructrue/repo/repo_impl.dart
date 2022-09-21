import 'package:aroundix_core/core.dart';
import 'package:aroundix_store/app/user/domain/entities/response_data.dart';
import 'package:aroundix_store/app/user/domain/entities/response_user_info.dart';
import '../../../../common/storage.dart';
import '../../domain/params/login_params.dart';
import '../../domain/params/sing_up_params.dart';
import '../../domain/repo/repo.dart';
import '../data_source/locale/user_storage.dart';
import '../data_source/remote/remote.dart';

class UserRepo implements IUserRepo {
  final UserRemote _userRemote;

  final UserStorage _userStorageWithStream;

  UserRepo(
      {required UserRemote userRemote,
      required UserStorage userStorage,
      required IStorageService storageService})
      : _userStorageWithStream = userStorage,
        _userRemote = userRemote;

  @override
  Future<ApiResult<ResponseData>> login(Params params) async {
    return toApiResult(() async {
      final result = await _userRemote.login(params as LoginParams);
      ResponseData responseUser = result.toAppModel();
      await savaUserWithStream(responseUser);
      return responseUser;
    });
  }

  @override
  Future<ApiResult<ResponseData>> signUp(Params params) async {
    return toApiResult(() async {
      final result = await _userRemote.signUp(params as SignUpParams);
      ResponseData responseUser = result.toAppModel();

      await savaUserWithStream(responseUser);
      return responseUser;
    });
  }

  @override
  Future<ApiResult<ResponseUserInfo>> getUserInfo() {
    return toApiResult(() async {
      final result = await _userRemote.getUserInfo();
      return result.toAppModel();
    });
  }

  @override
  Future<void> logout() {
    return savaUserWithStream(null);
  }

  Future<void> savaUserWithStream(ResponseData? data) async {
    await _userStorageWithStream.write(data);
  }

  @override
  ResponseData? get user {
    return _userStorageWithStream.read();
  }

  @override
  Stream<ResponseData?> get userStream => _userStorageWithStream.stream;
}
