import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import "package:meta_app/core/utils/extensions/build_context_ext.dart";
import 'package:meta_app/core/mixins/validator.dart';
import 'package:meta_app/presentation/navigation/app_router.gr.dart';
import 'package:meta_app/presentation/widgets/auth_field.dart';
import 'package:meta_app/presentation/widgets/auth_button.dart';
import 'package:meta_app/presentation/widgets/code_verification_section.dart';
import 'package:meta_app/presentation/widgets/fill_viewport_single_child_scroll_view.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';
import 'package:meta_app/data/repositories/api_repository_impl.dart';
import '../../core/utils/api_client.dart';
import '../../data/models/user.dart';
import '../redux/app_state.dart';
import '../redux/authorization/actions/login_user_action.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

var baseUrl = 'http://localhost:8080';
var token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ2aXRhbGlpLnBldHJ1bkBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImZlOWE0ZTAzLTAwNGEtNGRmYi05N2E5LWJiNDc1MjQ5YTk4QiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFkYW0iLCJleHAiOjE3MDg4NjEyNDgsImlzcyI6IkF1cm9yYUFQSSJ9.mmz-X1nJ5vOYCY7fcwUo-Ku8r6L_HCiBEuIZF30uSf0';
final _apiClient = ApiClient(
  baseUrl: baseUrl,
  token: token,
);
final _apiRepository = ApiRepositoryImpl(apiClient: _apiClient);

class _LoginPageState extends State<LoginPage> with Validator {
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

  Future<bool> login() async {
    try {
      var response = await _apiRepository.login(
        _loginController.text,
        _passwordController.text,
      );
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return true;
  }

  void _onLoginButtonPressed() async {
    if (_formKey.currentState?.validate() == false) return;
    bool response = await login();
    if (response) {
      User user = User(
        id: Random().nextInt(100).toString(),
        login: _loginController.text,
        email: _loginController.text,
        phoneNumber: _loginController.text,
        level: 1,
        balance: 0,
        transactions: [],
        products: [],
      );
      _loginAction(context, user);
      _goToProfilePage(context);
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
                    AuthField(
                      validator: (password) =>
                          validatePassword(password, context),
                      obscureText: true,
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
