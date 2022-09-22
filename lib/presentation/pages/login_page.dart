import 'package:flutter/material.dart';
import 'package:meta_app/presentation/assets_api.dart';
import 'package:meta_app/presentation/widgets/login_page/background_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/custom_field_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/forgot_password_row_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/login_button_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/password_field_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/sign_up_row_widget.dart';
import "package:meta_app/core/utils/extensions/build_context_ext.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _codeFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: context.gradient.purple,
              ),
              width: screenWidth * (550 / screenWidth),
              height: screenHeight * (750 / screenHeight),
              child: Padding(
                padding: const EdgeInsets.only(top: 70, right: 40, left: 40),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: Image.asset(AssetsApi.logo),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          context.localizations.authorization,
                          style: context.text.loginFormTitle,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text(
                              context.localizations.yourLogin,
                              style: context.text.loginFormText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomFieldWidget(
                              hint: context.localizations.yourLoginWithTip,
                              controller: _loginFieldController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              context.localizations.yourPassword,
                              style: context.text.loginFormText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: PasswordFieldWidget(
                              hint: context.localizations.yourPassword,
                              controller: _passwordFieldController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Icon(Icons.numbers),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        context.localizations.codeFromImage,
                                        style: context.text.loginFormText,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: CustomFieldWidget(
                                          controller: _codeFieldController,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: SignUpRowWidget(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Expanded(
                                  child: LoginButtonWidget(),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Divider(),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: ForgotPasswordRowWidget(),
                          ),
                        ],
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
