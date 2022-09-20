import 'package:flutter/material.dart';
import 'package:meta_app/presentation/themes/theme.dart';

class CodeFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const CodeFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          filled: true,
          fillColor: AppColors.formFieldFillColor,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
