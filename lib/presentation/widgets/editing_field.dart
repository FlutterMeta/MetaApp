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
    return Container(
      decoration: BoxDecoration(
        color: context.color.profilePagePrimary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 8,
      ),
      width: width,
      child: EditableText(
        controller: controller,
        cursorColor: context.color.profilePagePrimaryVariant,
        backgroundCursorColor: context.color.profilePagePrimaryVariant,
        style: context.text.profileBotsDefault.copyWith(fontSize: 24),
        cursorWidth: 2,
        textAlign: TextAlign.center,
        focusNode: FocusNode(),
      ),
    );
  }
}
