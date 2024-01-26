import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/mixins/validator.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/data/models/registration.dart';
import 'package:meta_app/data/repositories/api_repository_impl.dart';
import 'package:meta_app/presentation/widgets/auth_button.dart';
import 'package:meta_app/presentation/widgets/auth_field.dart';
import 'package:meta_app/presentation/widgets/code_verification_section.dart';
import 'package:meta_app/presentation/widgets/fill_viewport_single_child_scroll_view.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';

import '../../core/utils/api_client.dart';

var baseUrl = 'http://localhost:8080';
var token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ2aXRhbGlpLnBldHJ1bkBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImZlOWE0ZTAzLTAwNGEtNGRmYi05N2E5LWJiNDc1MjQ5YTk4QiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFkYW0iLCJleHAiOjE3MDg1NDI5MjYsImlzcyI6IkF1cm9yYUFQSSJ9.h5-iGIC05c6JMTBLASG9wqV7tQUF2-_mfQkr7yh9fdA';
final _apiClient = ApiClient(
  baseUrl: baseUrl,
  token: token,
);
final _apiRepository = ApiRepositoryImpl(apiClient: _apiClient);

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> with Validator {
  final _loginController = TextEditingController();
  final _emailController = TextEditingController();
  final _telegramController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  final _inviteCodeController = TextEditingController();
  final _imageCodeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _register() async {
    try {
      await _apiRepository.register(
        Registration(
          login: _loginController.text,
          email: _emailController.text,
          phoneNumber: _telegramController.text,
          password: _passwordController.text,
          referal: _inviteCodeController.text,
        ),
      );
      //context.router.navigateNamed('/client-profile');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _onRegisterButtonPressed() {
    _formKey.currentState?.validate();
    _register();
  }

  void _goToLoginPage() {
    context.router.navigateBack();
  }

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
                      context.localizations.createAccount,
                      style: context.text.registrationFormTitle,
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.accountName,
                        style: context.text.registrationFormText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthField(
                      validator: (login) => validateField(login, context),
                      hint: context.localizations.accountName,
                      controller: _loginController,
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.enterYourEmail,
                        style: context.text.registrationFormText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthField(
                      validator: (username) => validateField(username, context),
                      hint: context.localizations.enterYourEmail,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.yourTelegram,
                        style: context.text.registrationFormText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthField(
                      validator: (email) => validateEmail(email, context),
                      hint: context.localizations.yourTelegram,
                      controller: _telegramController,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.createAccountPassword,
                        style: context.text.registrationFormText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthField(
                      validator: (password) =>
                          validatePassword(password, context),
                      obscureText: true,
                      hint: context.localizations.createAccountPassword,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.repeatPassword,
                        style: context.text.registrationFormText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthField(
                      validator: (repeatPassword) => validateRepeatPassword(
                        repeatPassword,
                        _passwordController.text,
                        context,
                      ),
                      obscureText: true,
                      hint: context.localizations.repeatPassword,
                      controller: _repeatPasswordController,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.enterInvitationCode,
                        style: context.text.registrationFormText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthField(
                      validator: (code) => validateCode(code, context),
                      hint: context.localizations.enterInvitationCode,
                      controller: _inviteCodeController,
                    ),
                    const SizedBox(height: 20),
                    CodeVerificationSection(
                      child: AuthField(
                        validator: (code) => validateCode(code, context),
                        controller: _imageCodeController,
                      ),
                    ),
                    const SizedBox(height: 30),
                    AuthButton(
                      text: context.localizations.createAccount,
                      onPressed: _onRegisterButtonPressed,
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: _goToLoginPage,
                      child: Text(
                        context.localizations.alreadyHaveAccount,
                        style: context.text.haveAnAccount,
                      ),
                    ),
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
