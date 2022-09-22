import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:useful_extensions/useful_extensions.dart';

mixin Validator {
  String? validateLogin(String? login, BuildContext context) {
    if (login.isNullOrEmpty) {
      return context.localizations.loginMustNotBeEmpty;
    }
    return null;
  }

  String? validatePassword(
    String? password,
    BuildContext context, [
    minPasswordLength = 8,
  ]) {
    if (password.isNullOrEmpty) {
      return context.localizations.passwordMustNotBeEmpty;
    } else if (password!
        .trim()
        .isPasswordLengthLonger(length: minPasswordLength)
        .not()) {
      return context.localizations.passwordMustBeLonger(minPasswordLength);
    }
    return null;
  }

  String? validateCode(String? code, BuildContext context) {
    if (code.isNullOrEmpty) {
      return context.localizations.codeMustNotBeEmpty;
    }
    return null;
  }
}
