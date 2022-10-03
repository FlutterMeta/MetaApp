import 'package:flutter/material.dart';
import 'package:meta_app/core/mixins/validator.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/auth_field.dart';
import 'package:meta_app/presentation/widgets/auth_button.dart';
import 'package:meta_app/presentation/widgets/code_verification_section.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with Validator {
  final _loginFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _codeFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _goToForgotPasswordPage() => _formKey.currentState?.validate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        gradient: context.gradient.lightPurple,
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: context.gradient.purple,
              ),
              constraints: const BoxConstraints(
                maxWidth: 550,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 60),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 66,
                      child: Image.asset(AppAssets.logo),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      context.localizations.accessRecovery,
                      style: context.text.loginFormTitle,
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.logInSystem,
                        style: context.text.loginFormText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AuthField(
                      validator: (login) => validateLogin(login, context),
                      hint: context.localizations.logInSystem,
                      controller: _loginFieldController,
                    ),
                    const SizedBox(height: 20),
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
                      controller: _emailFieldController,
                    ),
                    const SizedBox(height: 20),
                    CodeVerificationSection(
                      child: AuthField(
                        validator: (code) => validateCode(code, context),
                        controller: _codeFieldController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    AuthButton(
                      text: context.localizations.restoreAccess,
                      onPressed: _goToForgotPasswordPage,
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
