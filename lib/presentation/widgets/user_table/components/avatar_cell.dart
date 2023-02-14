part of '../user_table.dart';

class _AvatarCell extends StatelessWidget {
  final String userName;

  const _AvatarCell({
    required this.userName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.account_circle,
          size: Responsive.isDesktop(context) ? 80 : 50,
          color: context.color.partnersCardBackground,
        ),
        const SizedBox(width: 8),
        _TableCell(
          title: context.localizations.nickname,
          content: Text(userName, style: context.text.adminUserTableLabel),
        ),
      ],
    );
  }
}
