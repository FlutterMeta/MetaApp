part of '../menu.dart';

class _LabeledField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const _LabeledField({
    required this.label,
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
          child: Text(
            "$label:",
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: context.screenWidth < 600 ? 200 : 300,
          child: TextField(
            controller: controller,
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            decoration: InputDecoration(
              filled: true,
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
