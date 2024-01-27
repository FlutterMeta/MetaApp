import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/mixins/validator.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/auth_field.dart';
import 'package:meta_app/presentation/widgets/auth_button.dart';
import 'package:meta_app/presentation/widgets/fill_viewport_single_child_scroll_view.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';

import '../../core/utils/api_client.dart';
import '../../data/repositories/api_repository_impl.dart';
import '../navigation/app_router.gr.dart';

class ResetAccessPage extends StatefulWidget {
  const ResetAccessPage({super.key});

  @override
  State<ResetAccessPage> createState() => _ResetAccessPageState();
}

var baseUrl = 'http://localhost:8080';
var token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ2aXRhbGlpLnBldHJ1bkBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImZlOWE0ZTAzLTAwNGEtNGRmYi05N2E5LWJiNDc1MjQ5YTk4QiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFkYW0iLCJleHAiOjE3MDg1NDI5MjYsImlzcyI6IkF1cm9yYUFQSSJ9.h5-iGIC05c6JMTBLASG9wqV7tQUF2-_mfQkr7yh9fdA';
final _apiClient = ApiClient(
  baseUrl: baseUrl,
  token: token,
);
final _apiRepository = ApiRepositoryImpl(apiClient: _apiClient);

class _ResetAccessPageState extends State<ResetAccessPage> with Validator {
  final _emailCodeController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onRestoreButtonPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      _showSuccessMessage();
      await Future.delayed(const Duration(seconds: 3));
      _goToLoginPage();
    }
  }

  void _goToLoginPage() => context.router.push(const LoginRoute());
  void _showSuccessMessage() {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height *
            0.1, // Adjust the position as needed
        left: MediaQuery.of(context).size.width * 0.1,
        child: Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.green, // You can style this as you want
            child: const Text(
              'Password changed successfully',
              style: TextStyle(
                color: Colors.white,
              ), // And style this text as you want
            ),
          ),
        ),
      ),
    );

    overlay?.insert(overlayEntry);

    // Automatically remove the overlay after 2 seconds
    Future.delayed(const Duration(seconds: 3))
        .then((value) => overlayEntry.remove());
  }

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
