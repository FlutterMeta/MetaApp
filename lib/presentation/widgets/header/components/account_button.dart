part of '../header.dart';

class _AccountButton extends StatelessWidget {
  const _AccountButton({Key? key}) : super(key: key);

  void _goToLoginPage(BuildContext context) {
    context.router.push(const LoginRoute());
  }

  void _goToClientProfilePage(BuildContext context) {
    context.router.push(ClientProfileRoute());
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, User?>(
      converter: (store) => store.state.currentUser,
      builder: (context, user) {
        return WebButton(
          onTap: () => user == null
              ? _goToLoginPage(context)
              : _goToClientProfilePage(context),
          child: Text(
            context.localizations.account,
            style: context.text.homePagePurpleBodyText,
          ),
        );
      },
    );
  }
}
