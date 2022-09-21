import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../../common/const/const/form_group_key.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../injection/service_locator.dart';
import '../../../widget/backgroub_circle.dart';
import '../../../widget/button_auth.dart';
import '../../../widget/text_under.dart';
import '../../../widget/title_name_App.dart';
import '../login/login_screen.dart';
import 'bloc/sign_up_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const path = 'sign-up';
  static const name = 'sign-up';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: MultiProvider(providers: [
        BlocProvider.value(value: si<SignUpBloc>()),
      ], child: const SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final signUpBloc = context.read<SignUpBloc>();
    final s = S.of(context);

    return BlocListener<SignUpBloc, SignUpState>(
      listener: _listener,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              const BackGroundCircle(key: ValueKey('sign up ')),
              ReactiveForm(
                formGroup: signUpBloc.form,
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
                              s.sign_up,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Icon(Icons.person_outline_outlined),
                          ],
                        ),
                        Text(
                          s.hallo,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const TitleNameApp(),
                        CustomStyleReactiveTextFiled(
                          hintText: s.enter_email,
                          prefixIcon: Icons.email_outlined,
                          validationMessages: {
                            ValidationMessage.email: (error) =>
                                s.enter_valid_email,
                            ValidationMessage.required: (error) => s.required,
                          },
                          formControlName: FormGroupKey.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Space.vM2,

                        CustomStyleReactiveTextFiled(
                          hintText: s.enter_name,
                          prefixIcon: Icons.person_outline_outlined,
                          formControlName: FormGroupKey.name,
                          validationMessages: {
                            ValidationMessage.required: (error) => s.required,
                          },
                        ),
                         Space.vM2,
                        CustomStyleReactiveTextFiled(
                          obscureText: true,
                          maxLine: 1,
                          hintText: s.enter_password,
                          prefixIcon: Icons.lock_open_outlined,
                          formControlName: FormGroupKey.password,
                          validationMessages: {
                            ValidationMessage.required: (error) => s.required,
                            ValidationMessage.mustMatch: (error) =>
                                s.password_is_not_the_match
                          },
                        ),
                        Space.vM2,

                        CustomStyleReactiveTextFiled(
                          obscureText: true,
                          maxLine: 1,
                          hintText: s.enter_password,
                          prefixIcon: Icons.lock_open_outlined,
                          formControlName: FormGroupKey.submitNewPassword,
                          validationMessages: {
                            ValidationMessage.required: (error) => s.required,
                            ValidationMessage.mustMatch: (error) =>
                            s.password_is_not_the_match
                          },
                        ),
                        Space.vM3,
                        Column(
                          children: [
                            BlocBuilder<SignUpBloc, SignUpState>(
                              builder: (context, state) {
                                if (state.signUpStatus.isLoading()) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                return ButtonAuth(
                                  onTap: () {
                                    _onSignUpPressed(context);
                                  },
                                  inLogin: false,
                                  isBig: true,
                                );
                              },
                            ),
                            Space.vM3,
                            TextUnder(
                              text: s.or_create_new_account,
                              color: Theme.of(context).colorScheme.primary,
                              align: Alignment.center,
                            )
                          ],
                        ),
                        Space.vS2,
                        ButtonAuth(
                          onTap: () => _onLoginPressed(context),
                          inLogin: false,
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
        ),
      ),
    );
  }

  void _onLoginPressed(BuildContext context) {
    context.pushNamed(LoginScreen.name);
  }

  void _onSignUpPressed(BuildContext context) {
    context.read<SignUpBloc>().add(SignUpSubmit());
  }

  void _listener(BuildContext context, SignUpState state) {
    if (state.signUpStatus.isFail()) {
      final scaffoldMessengerState = ScaffoldMessenger.of(context);
      scaffoldMessengerState.removeCurrentSnackBar();
      scaffoldMessengerState
          .showSnackBar(SnackBar(content: Text(state.signUpStatus.error!)));
    }
  }
}
