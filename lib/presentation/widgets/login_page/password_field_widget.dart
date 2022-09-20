import 'package:flutter/material.dart';
import 'package:meta_app/presentation/themes/theme.dart';

class PasswordFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const PasswordFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: "Your password",
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
