part of "../storybook_app.dart";

List<Story> get _pages => [
      RouterAwareStory(
        name: 'Pages/Home',
        initialRoutes: [HomeRoute()],
        router: AppRouter(),
      ),
      RouterAwareStory(
        name: 'Pages/LogIn',
        initialRoutes: const [LoginRoute()],
        router: AppRouter(),
      ),
      RouterAwareStory(
        name: 'Pages/Registration',
        initialRoutes: const [RegistrationRoute()],
        router: AppRouter(),
      ),
      RouterAwareStory(
        name: 'Pages/ForgotPassword',
        initialRoutes: const [ForgotPasswordRoute()],
        router: AppRouter(),
      ),
      RouterAwareStory(
        name: 'Pages/Products',
        initialRoutes: [ProductsRoute()],
        router: AppRouter(),
      ),
      RouterAwareStory(
        name: 'Pages/Partners',
        initialRoutes: [PartnersRoute()],
        router: AppRouter(),
      ),
      RouterAwareStory(
        name: 'Pages/Blog',
        initialRoutes: [BlogRoute()],
        router: AppRouter(),
      ),
      RouterAwareStory(
        name: 'Pages/Directions',
        initialRoutes: [DirectionsRoute()],
        router: AppRouter(),
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
