import 'package:flutter/material.dart';

import "package:meta_app/core/utils/extensions/build_context_ext.dart";
import 'package:meta_app/core/mixins/validator.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/login_page/auth_field_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/gradient_background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Validator {
  final _loginFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _codeFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        gradient: context.gradient.lightPurple,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: context.gradient.purple,
            ),
            constraints: const BoxConstraints(
              maxWidth: 550,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 60),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 65,
                      child: Image.asset(AppAssets.logo),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      context.localizations.authorization,
                      style: context.text.loginFormTitle,
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.localizations.yourLogin,
                        style: context.text.loginFormText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthFieldWidget(
                      validator: (login) => validateLogin(login, context),
                      hint: context.localizations.yourLoginWithTip,
                      controller: _loginFieldController,
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
                    AuthFieldWidget(
                      validator: (password) =>
                          validatePassword(password, context),
                      obscureText: true,
                      hint: context.localizations.yourPassword,
                      controller: _passwordFieldController,
                    ),
                    const SizedBox(height: 20),
                    _CodeVerificationSection(
                      authField: AuthFieldWidget(
                        validator: (code) => validateCode(code, context),
                        controller: _codeFieldController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _ForgotPasswordForm(onTap: () {}),
                    const SizedBox(height: 30),
                    _LoginButton(
                      onPressed: (() => _formKey.currentState?.validate()),
                    ),
                    const SizedBox(height: 15),
                    const Divider(),
                    const SizedBox(height: 20),
                    _SignUpForm(onTap: () {}),
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

class _ForgotPasswordForm extends StatelessWidget {
  final VoidCallback onTap;

  const _ForgotPasswordForm({
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

class _SignUpForm extends StatelessWidget {
  final VoidCallback onTap;

  const _SignUpForm({
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

class _LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _LoginButton({
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

class _CodeVerificationSection extends StatelessWidget {
  final Widget authField;
  const _CodeVerificationSection({
    required this.authField,
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
              authField,
            ],
          ),
        ),
      ],
    );
  }
}
