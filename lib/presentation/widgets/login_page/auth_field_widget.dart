import 'package:flutter/material.dart';
import "package:meta_app/core/utils/extensions/build_context_ext.dart";

class AuthFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final bool? isPasswordField;
  final String? Function(String?) validator;

  const AuthFieldWidget({
    required this.controller,
    this.hint,
    this.isPasswordField = false,
    required this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPasswordField as bool,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: context.text.loginFormHint,
        filled: true,
        fillColor: context.color.formFieldFill,
        errorStyle: context.text.loginFormError,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
