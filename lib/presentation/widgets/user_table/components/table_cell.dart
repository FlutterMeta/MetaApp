part of '../user_table.dart';

class _TableCell extends StatelessWidget {
  final String title;
  final Widget content;

  const _TableCell({
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.text.adminUserTableLabel.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 10),
        content,
      ],
    );
  }
}
