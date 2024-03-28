part of '../menu.dart';

class _LabeledField extends StatelessWidget {
  final String label;
  final String? Function(String?) validator;
  final String? hint;
  final TextEditingController controller;

  const _LabeledField({
    required this.label,
    required this.validator,
    this.hint,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Flexible(
            child: Text(
              "$label:",
              maxLines: 1,
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: context.screenWidth < 600 ? 200 : 300,
          child: TextFormField(
            validator: validator,
            controller: controller,
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            decoration: InputDecoration(
              filled: true,
              hintText: hint,
              hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 16),
              fillColor: context.color.profilePagePrimary.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
