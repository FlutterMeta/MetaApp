part of '../user_table.dart';

class UserGeneralInfoPanel extends StatelessWidget {
  final User user;

  const UserGeneralInfoPanel({
    required this.user,
    Key? key,
  }) : super(key: key);

  List<Widget> getCells(BuildContext context) {
    return [
      _AvatarCell(userName: user.login),
      const SizedBox(width: 10, height: 10),
      _TableCell(
        title: context.localizations.email,
        content: Text(user.email, style: context.text.adminUserTableLabel),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 20, left: 20, right: 20),
      color: context.color.profilePagePrimary.withOpacity(0.1),
      constraints: const BoxConstraints(maxWidth: 1270),
      child: Builder(builder: (context) {
        if (context.screenWidth < 410) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getCells(context),
          );
        }
        return Row(children: getCells(context));
      }),
    );
  }
}
