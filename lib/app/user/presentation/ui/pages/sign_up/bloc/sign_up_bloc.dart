import 'package:aroundix_core/core.dart';
import 'package:aroundix_design/design.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';


import '../../../../../../../common/const/const/form_group_key.dart';
import '../../../../../application/facade.dart';
import '../../../../../domain/params/sing_up_params.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserFacade _userFacade;

  SignUpBloc({required UserFacade userFacade})
      : _userFacade = userFacade,
        super(SignUpState()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpSubmit) {
        await signUpSubmit(emit);
      }
    });
  }

  Future<void> signUpSubmit(Emitter<SignUpState> emit) async {
    if (form.valid) {

      emit(state.copyWith(signUpStatus: const BlocStatus.loading()));
      final result = await _userFacade.signUp(SignUpParams(
          email: form.control(FormGroupKey.email).value,
          password: form.control(FormGroupKey.password).value,
          name: form.control(FormGroupKey.name).value));
      result.when(
          success: (e) =>
              emit(state.copyWith(signUpStatus: const BlocStatus.success())),
          failure: (e, v) {
            emit(state.copyWith(signUpStatus: BlocStatus.fail(error: e)));
          });
    } else {

      form.markAllAsTouched();
    }
  }

  final form = FormGroup({
    FormGroupKey.name: FormControl(
      validators: [
        Validators.required,
      ],
    ),
    FormGroupKey.email: FormControl<String>(
      validators: [
        Validators.required,
        Validators.email,
      ],
    ),
    FormGroupKey.password: FormControl(
      validators: [Validators.required],
    ),
    FormGroupKey.submitNewPassword: FormControl(
      validators: [
        Validators.required,
      ],
    ),
  }, validators: [
    Validators.mustMatch(FormGroupKey.password, FormGroupKey.submitNewPassword)
  ]);
}
