part of '../header.dart';

class _AuthButton extends StatelessWidget {
  const _AuthButton({Key? key}) : super(key: key);

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
