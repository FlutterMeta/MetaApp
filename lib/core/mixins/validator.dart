import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:useful_extensions/useful_extensions.dart';

mixin Validator {
  String? validateLogin(String? login, BuildContext context) {
    if (login.isNullOrEmpty) {
      return context.localizations.fieldMustNotBeEmpty;
    }
    return null;
  }

  String? validatePassword(
    String? password,
    BuildContext context, [
    minPasswordLength = 8,
  ]) {
    if (password.isNullOrEmpty) {
      return context.localizations.fieldMustNotBeEmpty;
    } else if (password
            ?.trim()
            .isPasswordLengthLonger(length: minPasswordLength)
            .not() as bool) {
      return context.localizations.passwordMustBeLonger(minPasswordLength);
    }
    return null;
  }

  String? validateCode(String? code, BuildContext context) {
    if (code.isNullOrEmpty) {
      return context.localizations.fieldMustNotBeEmpty;
    }
    return null;
  }

  String? validateField(
    String? field,
    BuildContext context,
  ) {
    if (field.isNullOrEmpty) {
      return context.localizations.fieldMustNotBeEmpty;
    }
    return null;
  }

  String? validateEmail(String? email, BuildContext context) {
    if (email.isEmailValid().not()) {
      return context.localizations.incorrectEmail;
    }
    return null;
  }

  String? validateRepeatPassword(
    String? repeatPassword,
    String? password,
    BuildContext context,
  ) {
    if (password != repeatPassword) {
      return context.localizations.repeatedPasswordDoesntMatch;
    }
    return null;
  }
}
