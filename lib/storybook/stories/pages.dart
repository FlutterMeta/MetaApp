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
      RouterAwareStory(
        name: "Pages/ResetPassword",
        initialRoutes: const [ResetPasswordRoute()],
        router: AppRouter(),
      ),
      RouterAwareStory(
        name: "Pages/ResetAccess",
        initialRoutes: const [ResetAccessRoute()],
        router: AppRouter(),
      ),
    ];
