import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/mixins/validator.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/navigation/app_router.gr.dart';
import 'package:meta_app/presentation/widgets/auth_field.dart';
import 'package:meta_app/presentation/widgets/auth_button.dart';
import 'package:meta_app/presentation/widgets/fill_viewport_single_child_scroll_view.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';

import '../../core/utils/api_client.dart';
import '../../data/repositories/api_repository_impl.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

var baseUrl = 'http://localhost:8080';
var token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ2aXRhbGlpLnBldHJ1bkBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImZlOWE0ZTAzLTAwNGEtNGRmYi05N2E5LWJiNDc1MjQ5YTk4QiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFkYW0iLCJleHAiOjE3MDg1NDI5MjYsImlzcyI6IkF1cm9yYUFQSSJ9.h5-iGIC05c6JMTBLASG9wqV7tQUF2-_mfQkr7yh9fdA';
final _apiClient = ApiClient(
  baseUrl: baseUrl,
  token: token,
);
final _apiRepository = ApiRepositoryImpl(apiClient: _apiClient);

class _ResetPasswordPageState extends State<ResetPasswordPage> with Validator {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onRestoreButtonPressed() async {
    bool? isFormValid = _formKey.currentState?.validate();
    if (isFormValid ?? false) {
      var response = await _apiRepository.forgotPassword(_emailController.text);
      if (response) {
        _goToResetAccessPage();
      }
      _showDialog(response);
    }
  }

  void _showDialog(bool response) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          response
              ? context.localizations.resetPasswordSuccess
              : context.localizations.resetPasswordError,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.router.pop();
            },
            child: Text(context.localizations.ok),
          ),
        ],
      ),
    );
  }

  void _goToResetAccessPage() {
    context.router.replace(const ResetAccessRoute());
  }

  @override
  void dispose() {
    _emailController.dispose();
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
              margin: const EdgeInsets.all(20),
              constraints: const BoxConstraints(maxWidth: 550),
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 60),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      context.localizations.resetPassword,
                      style: context.text.loginFormTitle,
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.registrationEmail,
                        style: context.text.loginFormText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AuthField(
                      validator: (email) => validateEmail(email, context),
                      hint: context.localizations.registrationEmail,
                      controller: _emailController,
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
