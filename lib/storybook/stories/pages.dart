part of "../storybook_app.dart";

List<Story> get _pages => [
      Story(
        name: 'Pages/Home',
        builder: (context) => HomePage(),
      ),
      Story(
        name: 'Pages/LogIn',
        builder: (context) => const LoginPage(),
      ),
      Story(
        name: 'Pages/Registration',
        builder: (context) => const RegistrationPage(),
      ),
      Story(
        name: 'Pages/ForgotPassword',
        builder: (context) => const ForgotPasswordPage(),
      ),
      Story(
        name: 'Pages/PartnersPage',
        builder: (context) => PartnersPage(),
      ),
    ];
