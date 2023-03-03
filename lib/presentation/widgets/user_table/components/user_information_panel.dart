part of '../user_table.dart';

class _UserInformationPanel extends StatelessWidget {
  final User user;

  const _UserInformationPanel({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        spacing: 20,
        runSpacing: 20,
        children: [
          _AvatarCell(userName: user.name),
          _TableCell(
            title: context.localizations.email,
            content: Text(user.email, style: context.text.adminUserTableLabel),
          ),
          _TableCell(
            title: context.localizations.referralLevel,
            content: Text(
              user.referralLevel.toString(),
              style: context.text.adminUserTableLabel,
            ),
          ),
          _TableCell(
            title: context.localizations.referrals,
            content: _ShowTextButton(
              onTap: () => context.router
                  .popAndPush(UserRefferalsRoute(user: user, userName: user.name)),
            ),
          ),
          _TableCell(
            title: context.localizations.transactionHistory,
            content: _ShowTextButton(
              onTap: () => context.router
                  .popAndPush(UserTransactionsRoute(user: user, userName: user.name)),
            ),
          ),
        ],
      ),
    );
  }
}
