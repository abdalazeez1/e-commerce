import '../../app/profile/application/facade.dart';
import '../../app/profile/presentation/state/bloc/profile_bloc.dart';
import '../service_locator.dart';

Future<void> profile() async {

  si.registerLazySingleton<ProfileFacade>(() => ProfileFacade(userApi: si()));
  si.registerSingleton<ProfileBloc>(ProfileBloc(facade: si()));

}
