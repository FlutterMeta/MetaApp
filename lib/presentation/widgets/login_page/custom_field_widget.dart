import 'package:flutter/material.dart';
import 'package:meta_app/presentation/themes/theme.dart';

class CustomFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;

  const CustomFieldWidget({
    Key? key,
    required this.controller,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 15.0,
          ),
          filled: true,
          fillColor: AppColors.formFieldFillColor,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
