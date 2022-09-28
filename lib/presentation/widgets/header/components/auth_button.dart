part of '../header.dart';

class _AuthButton extends StatelessWidget {
  const _AuthButton({Key? key}) : super(key: key);

  void _pushLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WebButton(
      onTap: () => _pushLoginPage(context),
      child: Text(
        context.localizations.account,
        style: context.text.homePagePurpleBodyText,
      ),
    );
  }
}
