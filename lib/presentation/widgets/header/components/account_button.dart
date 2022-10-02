part of '../header.dart';

class _AccountButton extends StatelessWidget {
  const _AccountButton({Key? key}) : super(key: key);

  void _goToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
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
