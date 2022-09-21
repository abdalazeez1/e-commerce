import 'package:aroundix_core/core.dart';
import 'package:aroundix_design/design.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../../common/const/const/form_group_key.dart';
import '../../../../../application/facade.dart';
import '../../../../../domain/params/login_params.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserFacade _userFacade;

  LoginBloc({required UserFacade facade})
      : _userFacade = facade,
        super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginSubmitted) {
        await loginSubmit(emit);
      }
    });
  }

  Future<void> loginSubmit(Emitter<LoginState> emit) async {

      if (form.valid) {
      emit(state.copWith(loginStatus: const BlocStatus.loading()));
      final result = await _userFacade.login(LoginParams(
          email: form.control(FormGroupKey.email).value,
          password: form.control(FormGroupKey.password).value));

      result.when(
          success: (e) =>
              emit(state.copWith(loginStatus: const BlocStatus.success())),
          failure: (e, v) {

            emit(state.copWith(loginStatus: BlocStatus.fail(error: e)));
          });
    } else {
      form.markAllAsTouched();
    }
  }

  final FormGroup form = FormGroup(
    {

      FormGroupKey.email: FormControl<String>(
        validators: [
          Validators.required,
          Validators.email,
        ],
      ),
      FormGroupKey.password: FormControl(
        validators: [Validators.required],
      ),
    },
  );
}

final phonePattern = RegExp(r'^\d{1,6}(?:-\d{0,4})?$');
