import 'package:aroundix_core/core.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../../../injection/service_locator.dart';
import '../../../../user/domain/entities/response_user_info.dart';
import '../../../application/facade.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileFacade _facade;

  ProfileBloc({required ProfileFacade facade})
      : _facade = facade,
        super(ProfileState()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetUserInfoProfile) {
        await getUserInfo(emit);
      }
    });
  }

  Future<void> getUserInfo(Emitter<ProfileState> emit) async {
    emit(state.copyWith(userInfo: const PageState.loading()));
    final result = await _facade.getUserInfo();

    result.when(
        success: (e) =>
            emit(state.copyWith(userInfo: PageState.loaded(data: e))),
        failure: (error, exception) {
          emit(state.copyWith(
              userInfo: PageState.error(exception: exception, error: error)));
        });
  }

  @override
  Future<void> close() {
    si.resetLazySingleton<ProfileBloc>();
    return super.close();
  }
}
