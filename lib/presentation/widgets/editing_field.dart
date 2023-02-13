import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

class EditingField extends StatelessWidget {
  final String value;
  final double width;
  final TextEditingController controller;

  const EditingField({
    required this.value,
    required this.width,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: context.color.profilePagePrimary.withOpacity(0.2),
        filled: true,
        hintText: value,
        hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 24),
        constraints: BoxConstraints(
          maxWidth: width,
          maxHeight: 30,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 6,
        ),
      ),
      style: context.text.profileBotsDefault.copyWith(fontSize: 24),
    );
  }
}
