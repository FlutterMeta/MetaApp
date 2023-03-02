import 'package:auto_route/auto_route.dart';
import 'package:meta_app/presentation/pages/admin_profile/dashboard_page.dart';
import 'package:meta_app/presentation/pages/admin_profile/transactions_page.dart';
import 'package:meta_app/presentation/pages/admin_profile/user_refferals_page.dart';
import 'package:meta_app/presentation/pages/admin_profile/user_transactions_page.dart';
import 'package:meta_app/presentation/pages/blog_page.dart/blog_page.dart';
import 'package:meta_app/presentation/pages/client_profile/client_profile_page.dart';
import 'package:meta_app/presentation/pages/directions_page/directions_page.dart';
import 'package:meta_app/presentation/pages/home_page/home_page.dart';
import 'package:meta_app/presentation/pages/login_page.dart';
import 'package:meta_app/presentation/pages/partners_page/partners_page.dart';
import 'package:meta_app/presentation/pages/products_page/products_page.dart';
import 'package:meta_app/presentation/pages/registration_page.dart';
import 'package:meta_app/presentation/pages/reset_access_page.dart';
import 'package:meta_app/presentation/pages/reset_password_page.dart';
import '../pages/admin_profile/financial_indicators_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, path: "/home"),
    AutoRoute(page: LoginPage, path: "/login"),
    AutoRoute(page: RegistrationPage, path: "/registration"),
    AutoRoute(page: ProductsPage, path: "/products"),
    AutoRoute(page: PartnersPage, path: "/partners"),
    AutoRoute(page: BlogPage, path: "/blog"),
    AutoRoute(page: DirectionsPage, path: "/directions"),
    AutoRoute(page: ResetPasswordPage, path: "/reset-password"),
    AutoRoute(page: ResetAccessPage, path: "/reset-access"),
    AutoRoute(page: ClientProfilePage, path: "/client-profile"),
    AutoRoute(
      page: FinancialIndicatorsPage,
      path: "/admin-profile/financial-indicators",
    ),
    AutoRoute(
      page: UserTransactionsPage,
      path: "/admin-profile/user-transactions/:userName",
    ),
    AutoRoute(page: DashboardPage, path: "/admin-profile/dashboard"),
    AutoRoute(page: TransactionsPage, path: "/admin-profile/transactions"),
    AutoRoute(
      page: UserRefferalsPage,
      path: "/admin-profile/user-refferals/:userName",
    ),
    AutoRoute(page: AdminBlogPage, path: "/admin-blog"),
  ],
)
class $AppRouter {}
