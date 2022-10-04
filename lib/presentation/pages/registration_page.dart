import 'package:flutter/material.dart';
import 'package:meta_app/core/mixins/validator.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/pages/login_page.dart';
import 'package:meta_app/presentation/widgets/auth_field.dart';
import 'package:meta_app/presentation/widgets/code_verification_section.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> with Validator {
  final _loginFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _telegramFieldController = TextEditingController();
  final _passFieldController = TextEditingController();
  final _repeatPassFieldController = TextEditingController();
  final _inviteCodeFieldController = TextEditingController();
  final _imageCodeFieldController = TextEditingController(); //!

  final _formKey = GlobalKey<FormState>();

  void _onRegisterButtonPressed() {
    _formKey.currentState?.validate();
  }

  void _goToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

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
                      context.localizations.createAccount,
                      style: context.text.loginFormTitle,
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.accountName,
                        style: context.text.loginFormText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthField(
                      validator: (login) => validateUsername(login, context),
                      hint: context.localizations.accountName,
                      controller: _loginFieldController,
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
                      validator: (username) =>
                          validateUsername(username, context),
                      hint: context.localizations.enterYourEmail,
                      controller: _telegramFieldController,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.yourTelegram,
                        style: context.text.loginFormText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthField(
                      validator: (email) => validateEmail(email, context),
                      hint: context.localizations.yourTelegram,
                      controller: _emailFieldController,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.createAccountPassword,
                        style: context.text.loginFormText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthField(
                      validator: (password) =>
                          validatePassword(password, context),
                      obscureText: true,
                      hint: context.localizations.createAccountPassword,
                      controller: _passFieldController,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.repeatPassword,
                        style: context.text.loginFormText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthField(
                      validator: (repeatPassword) => validateRepeatPass(
                        repeatPassword,
                        _passFieldController.text,
                        context,
                      ),
                      obscureText: true,
                      hint: context.localizations.repeatPassword,
                      controller: _repeatPassFieldController,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.enterInvitationCode,
                        style: context.text.loginFormText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthField(
                      validator: (code) => validateCode(code, context),
                      hint: context.localizations.enterInvitationCode,
                      controller: _telegramFieldController,
                    ),
                    const SizedBox(height: 20),
                    CodeVerificationSection(
                      child: AuthField(
                        validator: (code) => validateCode(code, context),
                        controller: _imageCodeFieldController,
                      ),
                    ),
                    const SizedBox(height: 30),
                    _RegisterButton(onPressed: _onRegisterButtonPressed),
                    const SizedBox(height: 20),
                    TextButton(
                      child: Text(
                        context.localizations.alreadyHaveAccount,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onPressed: () => _goToLoginPage(context),
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

class _RegisterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _RegisterButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.maxFinite,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(context.color.loginButtonFill),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        child: Text(
          context.localizations.login,
          style: context.text.loginButtonText,
        ),
      ),
    );
  }
}
