part of 'app_manger_bloc.dart';

@immutable
abstract class AppMangerEvent {
  const AppMangerEvent();
}

class AppMangerStarted extends AppMangerEvent {}

class AppMangerStateChanged extends AppMangerEvent {
  const AppMangerStateChanged({required this.state});

  final AppState state;
}

class AppMangerLoggedOut extends AppMangerEvent {}

