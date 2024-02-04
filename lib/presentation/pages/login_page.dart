import 'dart:html' as html;

import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import "package:meta_app/core/utils/extensions/build_context_ext.dart";
import 'package:meta_app/core/mixins/validator.dart';
import 'package:meta_app/presentation/navigation/app_router.gr.dart';
import 'package:meta_app/presentation/providers/users_notifier.dart';
import 'package:meta_app/presentation/widgets/auth_field.dart';
import 'package:meta_app/presentation/widgets/auth_button.dart';
import 'package:meta_app/presentation/widgets/code_verification_section.dart';
import 'package:meta_app/presentation/widgets/fill_viewport_single_child_scroll_view.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';
import 'package:meta_app/data/repositories/api_repository_impl.dart';
import '../../core/global.dart';
import '../../core/mixins/message_overlay.dart';
import '../../core/utils/api_client.dart';
import '../../data/models/transaction.dart';
import '../../data/models/user.dart';
import '../redux/app_state.dart';
import '../redux/authorization/actions/load_transactions_action.dart';
import '../redux/authorization/actions/login_user_action.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Validator, MessageOverlay {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _codeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _goToProfilePage(BuildContext context) =>
      context.router.push(ClientProfileRoute());

  void _goToRegistrationPage() =>
      context.router.push(const RegistrationRoute());

  void _loginAction(BuildContext context, User user) {
    StoreProvider.of<AppState>(context, null).dispatch(LoginUserAction(user));
  }

  void _loadTransactions(BuildContext context, User user) {
    StoreProvider.of<AppState>(context, null)
        .dispatch(LoadTransactionsAction(user.id));
  }

  Future<Response> login() async {
    late Response response;
    try {
      response = await apiRepository.login(
        _loginController.text,
        _passwordController.text,
      );
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  void _onLoginButtonPressed() async {
    //if (_formKey.currentState?.validate() == false) return; TODO: uncomment
    Response response = await login();

    //if (apiRepository.isSuccessfulStatusCode(response.statusCode) ||
    //    response.data["token"] != null) { TODO: uncomment
    if (true) {
      // Request to get user profile, by user's token
      String key = html.window.localStorage["token"] ?? "";
      ApiClient apiClient = ApiClient(baseUrl: baseUrl, token: key);
      ApiRepositoryImpl apiRepository = ApiRepositoryImpl(apiClient: apiClient);
      User? user = await apiRepository.userProfile();
      if (user != null) {
        showMessage(
          context.localizations.loginSuccess,
          Colors.green,
        );
        TextInput.finishAutofillContext();
        _loginAction(context, user);
        _goToProfilePage(context);
        _loadTransactions(context, user);
      }
    } else {
      showMessage(
        "${context.localizations.loginFailed}: ${response.data["title"]} ",
        Colors.red,
      );
    }
  }

  void _goToResetPasswordPage() =>
      context.router.replace(const ResetPasswordRoute());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FillViewportSingleChildScrollView(
        child: GradientBackground(
          gradient: context.gradient.lightIndigoTurquoise,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: context.gradient.indigoTurquoise,
              ),
              constraints: const BoxConstraints(
                maxWidth: 550,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 60),
              child: Form(
                key: _formKey,
                child: AutofillGroup(
                  child: Column(
                    children: [
                      Text(
                        context.localizations.authorization,
                        style: context.text.loginFormTitle,
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.localizations.enterYourEmail,
                          style: context.text.loginFormText,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AuthField(
                        autofillHints: const [AutofillHints.email],
                        validator: (email) => validateEmail(email, context),
                        hint: context.localizations.enterYourEmail,
                        controller: _loginController,
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.localizations.yourPassword,
                          style: context.text.loginFormText,
                        ),
                      ),
                      const SizedBox(height: 10),
                      PasswordField(
                        validator: (password) =>
                            validatePassword(password, context),
                        hint: context.localizations.yourPassword,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 20),
                      CodeVerificationSection(
                        child: AuthField(
                          validator: (code) => validateCode(code, context),
                          controller: _codeController,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _ForgotPasswordSection(onTap: _goToResetPasswordPage),
                      const SizedBox(height: 30),
                      AuthButton(
                        text: context.localizations.login,
                        onPressed: _onLoginButtonPressed,
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 20),
                      _SignUpSection(onTap: _goToRegistrationPage),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ForgotPasswordSection extends StatelessWidget {
  final VoidCallback onTap;

  const _ForgotPasswordSection({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.localizations.forgotPassword,
          style: context.text.loginFormText,
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: onTap,
          child: Text(
            context.localizations.restore,
            style: context.text.loginFormTextBold,
          ),
        ),
      ],
    );
  }
}

class _SignUpSection extends StatelessWidget {
  final VoidCallback onTap;

  const _SignUpSection({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.localizations.dontHaveAnAccount,
          style: context.text.loginFormText,
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: onTap,
          child: Text(
            context.localizations.signUp,
            style: context.text.loginFormTextBold,
          ),
        ),
      ],
    );
  }
}
