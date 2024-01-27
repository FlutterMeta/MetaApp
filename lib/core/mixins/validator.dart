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
      return context.localizations.fieldMustNotBeEmpty;
    }
    return null;
  }

  String? validateReferalCode(String? code) {
    if (code == null || code.isEmpty) {
      // If the field is optional and empty, return null (valid).
      return null;
    }

    // Define the pattern for the referral code.
    final pattern = RegExp(
      r'^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$',
    );

    if (!pattern.hasMatch(code)) {
      // If the code does not match the pattern, return an error message.
      return 'Invalid referral code. Format should be like fe9a4e03-004a-4dfb-97a9-bb475249a98B';
    }

    // If the code is valid, return null.
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

  String? validatePhoneNumber(String? phoneNumber, BuildContext context) {
    if (phoneNumber.isNullOrEmpty.not()) {
      if (RegExp(r'^\+?3?8?(0\d{9})$').hasMatch(phoneNumber!)) {
        return null;
      }

      return context.localizations.incorrectPhoneNumber;
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
