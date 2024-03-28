import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/mixins/validator.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/data/models/registration.dart';

import 'package:meta_app/presentation/widgets/auth_button.dart';
import 'package:meta_app/presentation/widgets/auth_field.dart';
import 'package:meta_app/presentation/widgets/captcha_dialog.dart';
import 'package:meta_app/presentation/widgets/fill_viewport_single_child_scroll_view.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';
import 'package:slider_captcha/slider_captcha.dart';

import '../../core/global.dart';
import '../../core/mixins/message_overlay.dart';
import '../constants/app_assets.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with Validator, MessageOverlay {
  final _loginController = TextEditingController();
  final _emailController = TextEditingController();
  final _telegramController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  final _inviteCodeController = TextEditingController();
  // final _imageCodeController = TextEditingController();
  final _sliderCaptchaController = SliderController();

  final _formKey = GlobalKey<FormState>();

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

        return CaptchaDialog(
          sliderCaptchaController: _sliderCaptchaController,
          assetPath: assetPath,
          onConfirm: _onRegisterButtonPressed,
        );
      },
    );
  }

  bool _checkFields() {
    if (_formKey.currentState?.validate() == false) return false;
    return true;
  }

  void _onRegisterButtonPressed() async {
    // if (!_checkFields()) return;
    late Response response;

    try {
      response = await apiRepository.register(
        Registration(
          login: _loginController.text,
          email: _emailController.text,
          phoneNumber: _telegramController.text,
          password: _passwordController.text,
          referal: _inviteCodeController.text,
        ),
      );
    } catch (e) {
      showMessage(
        "${context.localizations.error}:  ${response.data["errors"]}",
        Colors.red,
      );
    }
    if (apiRepository.isSuccessfulStatusCode(response.statusCode) ||
        response.data["token"] != null) {
      showMessage(
        context.localizations.registrationSuccess,
        Colors.green,
      );
      await Future.delayed(const Duration(seconds: 2));
      _goToLoginPage();
    } else {
      showMessage(
        "${context.localizations.error}: ${response.data["errors"] ?? response.data["detail"]}",
        Colors.red,
      );
    }
  }

  void _goToLoginPage() {
    context.router.navigateBack();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FillViewportSingleChildScrollView(
        child: GradientBackground(
          gradient: context.gradient.lightIndigoTurquoise,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 60),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        context.localizations.createAccount,
                        style: context.text.registrationFormTitle,
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.localizations.accountName,
                          style: context.text.registrationFormText,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AuthField(
                        validator: (login) => validateField(login, context),
                        hint: context.localizations.accountName,
                        controller: _loginController,
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.localizations.enterYourEmail,
                          style: context.text.registrationFormText,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AuthField(
                        validator: (email) => validateEmail(email, context),
                        hint: context.localizations.enterYourEmail,
                        controller: _emailController,
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.localizations.yourPhoneNumber,
                          style: context.text.registrationFormText,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AuthField(
                        validator: (email) =>
                            validatePhoneNumber(email, context),
                        hint: context.localizations.enterYourPhoneNumber,
                        controller: _telegramController,
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.localizations.createAccountPassword,
                          style: context.text.registrationFormText,
                        ),
                      ),
                      const SizedBox(height: 10),
                      PasswordField(
                        validator: (password) =>
                            validatePassword(password, context),
                        hint: context.localizations.createAccountPassword,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.localizations.repeatPassword,
                          style: context.text.registrationFormText,
                        ),
                      ),
                      const SizedBox(height: 10),
                      PasswordField(
                        validator: (repeatPassword) => validateRepeatPassword(
                          repeatPassword,
                          _passwordController.text,
                          context,
                        ),
                        hint: context.localizations.repeatPassword,
                        controller: _repeatPasswordController,
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.localizations.enterInvitationCode,
                          style: context.text.registrationFormText,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AuthField(
                        validator: (code) => validateReferalCode(code),
                        hint: context.localizations.enterInvitationCode,
                        controller: _inviteCodeController,
                      ),
                      const SizedBox(height: 20),
                      AuthButton(
                        text: context.localizations.createAccount,
                        onPressed: () {
                          if (_checkFields()) _showCaptchaDialog(context);
                        },
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: _goToLoginPage,
                        child: Text(
                          context.localizations.alreadyHaveAccount,
                          style: context.text.haveAnAccount,
                        ),
                      ),
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
