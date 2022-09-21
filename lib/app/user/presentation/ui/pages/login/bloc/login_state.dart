part of 'login_bloc.dart';

class LoginState {
  // final BlocStatus status;
  final BlocStatus loginStatus;

  const LoginState(
      {
        // this.status = const BlocStatus.initial(),
      this.loginStatus = const BlocStatus.initial()});

  copWith({
    // BlocStatus? status,
    BlocStatus? loginStatus}) => LoginState(
      // status: status ?? this.status,
      loginStatus: loginStatus ?? this.loginStatus);
}
