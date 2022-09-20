import 'package:flutter/material.dart';
import 'package:meta_app/presentation/themes/theme.dart';
import 'package:meta_app/presentation/widgets/login_page/background_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/code_field_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/forgot_password_row_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/login_button_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/login_field_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/password_field_widget.dart';
import 'package:meta_app/presentation/widgets/login_page/sign_up_row_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _codeFieldController = TextEditingController();

  String loginBuff = "";
  String passwordBuff = "";
  String codeBuff = "";

  void loginFieldListener() {
    loginBuff = _loginFieldController.text;
  }

  void passwordFieldListener() {
    passwordBuff = _loginFieldController.text;
  }

  void codeFieldListener() {
    codeBuff = _loginFieldController.text;
  }

  @override
  void initState() {
    _loginFieldController.addListener(loginFieldListener);
    _passwordFieldController.addListener(passwordFieldListener);
    _codeFieldController.addListener(codeFieldListener);
    super.initState();
  }

  @override
  void dispose() {
    _loginFieldController.removeListener(loginFieldListener);
    _passwordFieldController.removeListener(passwordFieldListener);
    _codeFieldController.removeListener(codeFieldListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: AppColors.formBackgroundGradient,
              ),
              width: MediaQuery.of(context).size.width *
                  (550 / MediaQuery.of(context).size.width),
              height: MediaQuery.of(context).size.width *
                  (800 / MediaQuery.of(context).size.width),
              child: Padding(
                padding: const EdgeInsets.only(top: 60, right: 40, left: 40),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        child: Image.asset('assets/images/multimeta_white.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "Authorization",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text(
                              "Your login",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: LoginFieldWidget(
                              controller: _loginFieldController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "Your password",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: PasswordFieldWidget(
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
                                        "Code from an image*",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: CodeFieldWidget(
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
