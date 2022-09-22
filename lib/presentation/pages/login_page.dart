import 'package:flutter/material.dart';

import "package:meta_app/core/utils/extensions/build_context_ext.dart";
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/login_page/auth_field_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/gradient_background_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/login_button_widget.dart';
import 'package:meta_app/core/mixins/validator.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GradientBackgroundWidget(
        gradient: context.gradient.lightPurple,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: context.gradient.purple,
              ),
              width: screenWidth * (550 / screenWidth),
              height: screenHeight * (800 / screenHeight),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
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
                        validator: (login) {
                          return validateLogin(login, context);
                        },
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
                        validator: (password) {
                          return validatePassword(password, context);
                        },
                        isPasswordField: true,
                        hint: context.localizations.yourPassword,
                        controller: _passwordFieldController,
                      ),
                      const SizedBox(height: 20),
                      Row(
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
                                AuthFieldWidget(
                                  validator: (code) {
                                    return validateCode(code, context);
                                  },
                                  controller: _codeFieldController,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _SignUpRowWidget(onTap: () {}),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: LoginButtonWidget(
                              onPressed: (() =>
                                  _formKey.currentState?.validate()),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Divider(),
                      const SizedBox(height: 20),
                      _ForgotPasswordWidget(onTap: () {}),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ForgotPasswordWidget extends StatelessWidget {
  final VoidCallback onTap;

  const _ForgotPasswordWidget({
    Key? key,
    required this.onTap,
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

class _SignUpRowWidget extends StatelessWidget {
  final VoidCallback onTap;

  const _SignUpRowWidget({
    Key? key,
    required this.onTap,
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
