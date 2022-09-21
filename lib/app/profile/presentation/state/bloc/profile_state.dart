part of 'profile_bloc.dart';

class ProfileState {
  final PageState<ResponseUserInfo> userInfo;

  ProfileState({this.userInfo = const PageState.init()});

  copyWith({PageState<ResponseUserInfo>? userInfo}) =>
      ProfileState(userInfo: userInfo ?? this.userInfo);
}
