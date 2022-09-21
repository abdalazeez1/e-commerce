

import '../../app/user/api.dart';
import '../../app/user/application/facade.dart';
import '../../app/user/domain/repo/repo.dart';
import '../../app/user/infrastructrue/data_source/locale/user_storage.dart';
import '../../app/user/infrastructrue/data_source/remote/remote.dart';
import '../../app/user/infrastructrue/repo/repo_impl.dart';
import '../../app/user/presentation/ui/pages/login/bloc/login_bloc.dart';
import '../../app/user/presentation/ui/pages/sign_up/bloc/sign_up_bloc.dart';
import '../service_locator.dart';

Future<void> user() async {
  si.registerSingleton(UserRemote(si()));
  si.registerSingleton(UserStorage(si()));
  si.registerLazySingleton<IUserRepo>(
      () => UserRepo(userRemote: si(), userStorage: si(),storageService: si()));
  si.registerLazySingleton<UserFacade>(() => UserFacade(userRepo: si()));
  si.registerFactory(() => LoginBloc(facade: si()));
  si.registerFactory(() => SignUpBloc(userFacade: si()));
  si.registerFactory(() => UserApi(userFacade: si()));
}
