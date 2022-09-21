import 'dart:async';

import 'package:aroundix_store/app/user/domain/entities/response_data.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


import '../../app/user/application/facade.dart';
import '../../injection/service_locator.dart';

part 'app_manger_event.dart';

part 'app_manger_state.dart';

class AppMangerBloc extends Bloc<AppMangerEvent, AppMangerState> {
  AppMangerBloc({this.doBeforeOpen}) : super(const AppMangerState.initial()) {
    on<AppMangerEvent>(_handler);
  }

  late final UserFacade _facade;
  late final StreamSubscription<ResponseData?> _streamSubscription;
  late final StreamSubscription<Uri?>? _sub;

  final FutureOr<void> Function()? doBeforeOpen;

  FutureOr<void> _handler(
      AppMangerEvent event, Emitter<AppMangerState> emit) async {
    if (event is AppMangerStarted) {
      await _mapAppStarted();
    } else if (event is AppMangerStateChanged) {
      emit(state.copyWith(state: event.state));
    } else if (event is AppMangerLoggedOut) {
      await _facade.logout();
      add(const AppMangerStateChanged(state: AppState.unAuthenticated));
    }
  }

  Future<void> _mapAppStarted() async {
    await doBeforeOpen?.call();
    add(const AppMangerStateChanged(state: AppState.unAuthenticated));
    _facade = si();
    _streamSubscription = _facade.userStream.listen(_userListener);
  }

  void _userListener(ResponseData? user) {
    late final AppState newState;
    if (user == null) {
      newState = AppState.unAuthenticated;
    } else {
      newState = AppState.authenticated;
    }
    add(AppMangerStateChanged(state: newState));
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    _sub?.cancel();
    return super.close();
  }
}
