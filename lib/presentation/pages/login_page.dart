import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import "package:meta_app/core/utils/extensions/build_context_ext.dart";
import 'package:meta_app/core/mixins/validator.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/navigation/app_router.gr.dart';

import 'package:meta_app/presentation/widgets/auth_field.dart';
import 'package:meta_app/presentation/widgets/auth_button.dart';

import 'package:meta_app/presentation/widgets/fill_viewport_single_child_scroll_view.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';
import 'package:slider_captcha/slider_captcha.dart';
import '../../core/global.dart';
import '../../core/mixins/message_overlay.dart';
import '../../data/models/user.dart';
import '../redux/app_state.dart';

import '../redux/authorization/actions/login_user_action.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Validator, MessageOverlay {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  // final _codeController = TextEditingController();
  final _sliderCaptchaController = SliderController();

  final _formKey = GlobalKey<FormState>();

  void _goToProfilePage(BuildContext context) =>
      context.router.push(ClientProfileRoute());

  void _goToRegistrationPage() =>
      context.router.push(const RegistrationRoute());

  void _loginAction(BuildContext context, User user) {
    StoreProvider.of<AppState>(context, null).dispatch(LoginUserAction(user));
  }

  Future<Response> login() async {
    late Response response;
    try {
      response = await apiRepository.login(
        _loginController.text,
        _passwordController.text,
      );
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  bool _checkFields() {
    if (_formKey.currentState?.validate() == false) return false;
    return true;
  }

  void _onLoginButtonPressed() async {
    Response response = await login();

    if (apiRepository.isSuccessfulStatusCode(response.statusCode) ||
        response.data["token"] != null) {
      debugPrint("Token: ${response.data["token"]}");
      tokenStorage.saveToken(response.data["token"]);
      User? user = await apiRepository.userProfile();

      if (user != null) {
        showMessage(
          context.localizations.loginSuccess,
          Colors.green,
        );
        debugPrint("User: $user");

        TextInput.finishAutofillContext();
        _loginAction(context, user);
        _goToProfilePage(context);
      }
    } else {
      String text = response.data["title"].toString().contains("Unathorized")
          ? context.localizations.wrongEmailOrPassword
          : response.data["title"].toString();
      showMessage(
        "${context.localizations.loginFailed}:  $text",
        Colors.red,
      );
    }
  }

  void _goToResetPasswordPage() =>
      context.router.replace(const ResetPasswordRoute());

  void _showCaptchaDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String assetPath = AppAssets.sliderCaptcha1;

        // Generate a random index between 1 and 3
        int randomIndex = Random().nextInt(3) + 1;

        // Assign the asset path based on the random index
        switch (randomIndex) {
          case 1:
            assetPath = AppAssets.sliderCaptcha1;
            break;
          case 2:
            assetPath = AppAssets.sliderCaptcha2;
            break;
          case 3:
            assetPath = AppAssets.sliderCaptcha3;
            break;
        }

        Image image = Image.asset(
          assetPath,
          fit: BoxFit.fitWidth,
        );

        return AlertDialog(
          backgroundColor: context.color.postBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(context.localizations.captcha),
          content: SliderCaptcha(
            controller: _sliderCaptchaController,
            title: context.localizations.sliderCaptchaTitle,
            titleStyle: context.text.authFormHint,
            imageToBarPadding: 10,
            image: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                    width: 3, color: context.color.profilePageAboveBackground),
                color: context.color.profilePageBackground,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            colorBar: context.color.profilePageBackground, //slider color
            colorCaptChar:
                context.color.profilePageAboveBackground, //puzzle hole place
            onConfirm: (value) async {
              Future.delayed(const Duration(seconds: 1));
              if (value) {
                _onLoginButtonPressed();
              } else {
                showMessage(
                  context.localizations.captchaFailed,
                  Colors.red,
                );
              }
            },
          ),
        );
      },
    );
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
                child: AutofillGroup(
                  child: Column(
                    children: [
                      Text(
                        context.localizations.authorization,
                        style: context.text.loginFormTitle,
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
                        autofillHints: const [AutofillHints.email],
                        validator: (email) => validateEmail(email, context),
                        hint: context.localizations.enterYourEmail,
                        controller: _loginController,
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
                      PasswordField(
                        validator: (password) =>
                            validatePassword(password, context),
                        hint: context.localizations.yourPassword,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 20),
                      _ForgotPasswordSection(onTap: _goToResetPasswordPage),
                      const SizedBox(height: 30),
                      AuthButton(
                        text: context.localizations.login,
                        onPressed: () {
                          if (_checkFields()) _showCaptchaDialog(context);
                        },
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 20),
                      _SignUpSection(onTap: _goToRegistrationPage),
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

class _ForgotPasswordSection extends StatelessWidget {
  final VoidCallback onTap;

  const _ForgotPasswordSection({
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

class _SignUpSection extends StatelessWidget {
  final VoidCallback onTap;

  const _SignUpSection({
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
