import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/global.dart';
import 'package:meta_app/core/mixins/validator.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/auth_field.dart';
import 'package:meta_app/presentation/widgets/auth_button.dart';
import 'package:meta_app/presentation/widgets/fill_viewport_single_child_scroll_view.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';

import '../../core/mixins/message_overlay.dart';
import '../navigation/app_router.gr.dart';

class ResetAccessPage extends StatefulWidget {
  const ResetAccessPage({super.key});

  @override
  State<ResetAccessPage> createState() => _ResetAccessPageState();
}

class _ResetAccessPageState extends State<ResetAccessPage>
    with Validator, MessageOverlay {
  final _emailController = TextEditingController();
  final _emailCodeController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onRestoreButtonPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      Response response;
      try {
        response = await apiRepository.resetPassword(
          _emailController.text,
          _emailCodeController.text,
          _newPasswordController.text,
        );
        if (!apiRepository.isSuccessfulStatusCode(response.statusCode)) {
          debugPrint('Error: ${response.statusCode}');
          showMessage(
            context.localizations.resetPasswordError,
            Colors.red,
          );
          return;
        }
      } catch (e) {
        showMessage(
          context.localizations.resetPasswordError,
          Colors.red,
        );
        return;
      }
      showMessage(
        context.localizations.resetPasswordSuccess,
        Colors.green,
      );
      await Future.delayed(const Duration(seconds: 3));
      _goToLoginPage();
    }
  }

  void _goToLoginPage() => context.router.push(const LoginRoute());

  @override
  void dispose() {
    _emailCodeController.dispose();
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
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
              constraints: const BoxConstraints(maxWidth: 550),
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 60),
              margin: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      context.localizations.resetAccess,
                      style: context.text.loginFormTitle,
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.email,
                        style: context.text.loginFormText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AuthField(
                      validator: (login) => validateEmail(login, context),
                      hint: context.localizations.enterYourEmail,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.codeFromEmail,
                        style: context.text.loginFormText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AuthField(
                      validator: (login) => validateLogin(login, context),
                      hint: context.localizations.codeFromEmail,
                      controller: _emailCodeController,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.newPassword,
                        style: context.text.loginFormText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    PasswordField(
                      validator: (password) =>
                          validatePassword(password, context),
                      hint: context.localizations.newPassword,
                      controller: _newPasswordController,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.repeatNewPassword,
                        style: context.text.loginFormText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    PasswordField(
                      validator: (password) => validateRepeatPassword(
                        password,
                        _newPasswordController.text,
                        context,
                      ),
                      hint: context.localizations.repeatNewPassword,
                      controller: _repeatPasswordController,
                    ),
                    const SizedBox(height: 40),
                    AuthButton(
                      text: context.localizations.restoreAccess,
                      onPressed: _onRestoreButtonPressed,
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
