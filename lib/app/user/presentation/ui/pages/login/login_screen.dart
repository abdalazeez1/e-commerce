import 'package:aroundix_core/core.dart';
import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../common/app_manger/app_manger_bloc.dart';
import '../../../../../../common/const/const/form_group_key.dart';
import '../../../../../../common/widget/motion_toast.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../injection/service_locator.dart';
import '../../../widget/backgroub_circle.dart';
import '../../../widget/button_auth.dart';
import '../../../widget/text_under.dart';
import '../../../widget/title_name_App.dart';
import '../sign_up/sign_up_screen.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const path = 'login';
  static const name = 'login_screen';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: BlocProvider<LoginBloc>(
          create: (context) => si(), child: const LoginScreen()),
    );
  }

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    final s = S.of(context);

    return BlocListener<LoginBloc, LoginState>(
      listener: _listener,
      child: SafeArea(
        child: Scaffold(
          body: BlocSelector<LoginBloc, LoginState, BlocStatus>(
            selector: (state) {
              return state.loginStatus;
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state.isLoading() ? true : false,
                child: Stack(
                  children: [
                    const BackGroundCircle(),
                    ReactiveForm(
                      formGroup: loginBloc.form,
                      child: SingleChildScrollView(
                        child: RPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Space.vL2,
                              Row(
                                children: [
                                  Text(
                                    s.login_account,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(Icons.person_outline_outlined),
                                ],
                              ),
                              Text(
                                s.welcome_back,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const TitleNameApp(),
                              CustomStyleReactiveTextFiled(
                                hintText: s.enter_email,
                                prefixIcon: Icons.email_outlined,
                                validationMessages: {
                                  ValidationMessage.email: (error) =>
                                      s.enter_valid_email,
                                  ValidationMessage.required: (error) =>
                                      s.required,
                                },
                                formControlName: FormGroupKey.email,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const RSizedBox.vertical(16),
                              CustomStyleReactiveTextFiled(
                                hintText: s.enter_password,
                                obscureText: true,
                                maxLine: 1,
                                prefixIcon: Icons.lock_open_outlined,
                                formControlName: FormGroupKey.password,
                                validationMessages: {
                                  ValidationMessage.required: (error) =>
                                      s.required,
                                },
                              ),
                              Space.vM4,
                              Column(
                                children: [
                                  BlocBuilder<LoginBloc, LoginState>(
                                    builder: (context, state) {
                                      if (state.loginStatus.isLoading()) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                      return ButtonAuth(
                                        onTap: () {
                                          _onLoginPressed(context);
                                        },
                                        isBig: true,
                                      );
                                    },
                                  ),
                                  Space.vM3,
                                  TextUnder(
                                    text: s.or_create_new_account,
                                    align: Alignment.center,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )
                                ],
                              ),
                              Space.vS2,
                              ButtonAuth(
                                onTap: () => _onSignUpPressed(context),
                                isBig: false,
                              ),
                              Space.vL2,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onLoginPressed(BuildContext context) {
    context.read<LoginBloc>().add(LoginSubmitted());
  }

  void _onSignUpPressed(BuildContext context) {
    context.pushNamed(SignUpScreen.name);
  }

  void _listener(BuildContext context, LoginState state) {
    if (state.loginStatus.isFail()) {
      FocusScope.of(context).unfocus();
      showToast(
          context: context,
          text: 'error Occurred', //todo transleter errpr
          description: state.loginStatus.error ?? 'some thing wrong ',
          contentType: ContentType.failure);
    }

    if (state.loginStatus.isSuccess()) {
      context
          .read<AppMangerBloc>()
          .add(const AppMangerStateChanged(state: AppState.authenticated));
    }
  }
}
