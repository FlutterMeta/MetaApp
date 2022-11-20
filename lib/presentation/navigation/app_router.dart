import 'package:auto_route/auto_route.dart';
import 'package:meta_app/presentation/pages/blog_page.dart/blog_page.dart';
import 'package:meta_app/presentation/pages/directions_page/directions_page.dart';
import 'package:meta_app/presentation/pages/forgot_password_page.dart';
import 'package:meta_app/presentation/pages/home_page/home_page.dart';
import 'package:meta_app/presentation/pages/login_page.dart';
import 'package:meta_app/presentation/pages/partners_page/partners_page.dart';
import 'package:meta_app/presentation/pages/products_page/products_page.dart';
import 'package:meta_app/presentation/pages/registration_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, path: "/home"),
    AutoRoute(page: LoginPage, path: "/login"),
    AutoRoute(page: RegistrationPage, path: "/registration"),
    AutoRoute(page: ForgotPasswordPage, path: "/forgot-password"),
    AutoRoute(page: ProductsPage, path: "/products"),
    AutoRoute(page: PartnersPage, path: "/partners"),
    AutoRoute(page: BlogPage, path: "/blog"),
    AutoRoute(page: DirectionsPage, path: "/directions"),
  ],
)
class $AppRouter {}
