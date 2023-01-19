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
        name: 'Pages/Products',
        builder: (context) => ProductsPage(),
      ),
      Story(
        name: 'Pages/Partners',
        builder: (context) => PartnersPage(),
      ),
      Story(
        name: 'Pages/Blog',
        builder: (context) => BlogPage(),
      ),
      Story(
        name: 'Pages/Directions',
        builder: (context) => DirectionsPage(),
      ),
      Story(
        name: "Reset Password",
        builder: (context) => const ResetPasswordPage(),
      ),
      Story(
        name: "Reset Access",
        builder: (context) => const ResetAccessPage(),
      ),
    ];
