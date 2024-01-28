import 'package:flutter/material.dart';
import "package:meta_app/core/utils/extensions/build_context_ext.dart";

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final bool obscureText;
  final String? Function(String?) validator;
  final Iterable<String>? autofillHints;

  const AuthField({
    required this.controller,
    this.hint,
    this.autofillHints,
    this.obscureText = false,
    required this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: context.text.authFormHint,
        filled: true,
        fillColor: context.color.formFieldFill,
        errorStyle: context.text.authFormError,
        errorMaxLines: 3,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String? hint;

  const PasswordField({
    required this.controller,
    required this.validator,
    this.hint,
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: _isObscured,
      autofillHints: const [AutofillHints.password],
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: context.text.authFormHint,
        filled: true,
        fillColor: context.color.formFieldFill,
        errorStyle: context.text.authFormError,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscured ? Icons.visibility : Icons.visibility_off,
            color: context.color.profilePagePrimary,
          ),
          onPressed: _toggleObscureText,
        ),
      ),
    );
  }

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }
}
