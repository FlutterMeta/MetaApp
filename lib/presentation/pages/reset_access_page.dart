import 'package:flutter/material.dart';
import 'package:meta_app/core/mixins/validator.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/auth_field.dart';
import 'package:meta_app/presentation/widgets/auth_button.dart';
import 'package:meta_app/presentation/widgets/fill_viewport_single_child_scroll_view.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';

class ResetAccessPage extends StatefulWidget {
  const ResetAccessPage({super.key});

  @override
  State<ResetAccessPage> createState() => _ResetAccessPageState();
}

class _ResetAccessPageState extends State<ResetAccessPage> with Validator {
  final _emailCodeController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _onRestoreButtonPressed() => _formKey.currentState?.validate();

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
                    AuthField(
                      validator: (password) =>
                          validatePassword(password, context),
                      hint: context.localizations.newPassword,
                      controller: _newPasswordController,
                      obscureText: true,
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
                    AuthField(
                      validator: (password) => validateRepeatPassword(
                        password,
                        _newPasswordController.text,
                        context,
                      ),
                      obscureText: true,
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
