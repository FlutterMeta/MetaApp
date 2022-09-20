import 'package:flutter/material.dart';
import 'package:meta_app/presentation/themes/theme.dart';

class LoginFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const LoginFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: "Your login (account name)",
          hintStyle: TextStyle(
            fontSize: 15.0,
          ),
          filled: true,
          fillColor: AppColors.formFieldFillColor,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
