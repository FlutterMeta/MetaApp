part of '../header.dart';

class _AccountButton extends StatelessWidget {
  const _AccountButton({Key? key}) : super(key: key);

  void _goToLoginPage(BuildContext context) {
    context.router.push(const LoginRoute());
  }

  @override
  Widget build(BuildContext context) {
    return WebButton(
      onTap: () => _goToLoginPage(context),
      child: Text(
        context.localizations.account,
        style: context.text.homePagePurpleBodyText,
      ),
    );
  }
}
