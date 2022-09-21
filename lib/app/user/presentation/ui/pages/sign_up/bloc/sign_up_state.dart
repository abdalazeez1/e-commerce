part of 'sign_up_bloc.dart';

class SignUpState {
  final BlocStatus signUpStatus;
  final BlocStatus checkCodeStatus;
  //
  SignUpState({
    this.signUpStatus = const BlocStatus.initial(),
    this.checkCodeStatus = const BlocStatus.initial(),
  });

  copyWith({
    BlocStatus? signUpStatus,
    BlocStatus? checkCodeStatus,
  }) =>
      SignUpState(
        signUpStatus: signUpStatus ?? this.signUpStatus,
        checkCodeStatus: checkCodeStatus ?? this.checkCodeStatus,
      );
}
