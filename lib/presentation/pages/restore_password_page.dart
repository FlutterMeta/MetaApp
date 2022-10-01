import 'package:flutter/material.dart';
import 'package:meta_app/core/mixins/validator.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/auth_field.dart';
import 'package:meta_app/presentation/widgets/entry_flow_button.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';

class RestorePasswordPage extends StatefulWidget {
  const RestorePasswordPage({super.key});

  @override
  State<RestorePasswordPage> createState() => _RestorePasswordPageState();
}

class _RestorePasswordPageState extends State<RestorePasswordPage>
    with Validator {
  final _loginFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _codeFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onRestoreButtonPressed() => _formKey.currentState?.validate();

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
                        context.localizations.loginInSys,
                        style: context.text.loginFormText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AuthField(
                      validator: (login) => validateLogin(login, context),
                      hint: context.localizations.loginInSys,
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
                    _CodeVerificationSection(
                      child: AuthField(
                        validator: (code) => validateCode(code, context),
                        controller: _codeFieldController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    EntryFlowButton(
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

class _CodeVerificationSection extends StatelessWidget {
  final Widget child;

  const _CodeVerificationSection({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Icon(Icons.numbers),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localizations.codeFromImage,
                style: context.text.loginFormText,
              ),
              const SizedBox(height: 10),
              child,
            ],
          ),
        ),
      ],
    );
  }
}
