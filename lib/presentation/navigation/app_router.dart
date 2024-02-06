import 'package:auto_route/auto_route.dart';
import 'package:meta_app/presentation/pages/admin_profile/dashboard_page.dart';
import 'package:meta_app/presentation/pages/admin_profile/payment_system_overview_page.dart';
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
    CustomRoute(
      page: HomePage,
      path: "/home",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: LoginPage,
      path: "/login",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: RegistrationPage,
      path: "/registration",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: ProductsPage,
      path: "/products",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: PartnersPage,
      path: "/partners",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: BlogPage,
      path: "/blog",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: DirectionsPage,
      path: "/directions",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: ResetPasswordPage,
      path: "/reset-password",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: ResetAccessPage,
      path: "/reset-access",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: ClientProfilePage,
      path: "/profile",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: FinancialIndicatorsPage,
      path: "/admin-profile/financial-indicators",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: UserTransactionsPage,
      path: "/admin-profile/user-transactions/:userName",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: DashboardPage,
      path: "/admin-profile/dashboard",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: TransactionsPage,
      path: "/admin-profile/transactions",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: UserRefferalsPage,
      path: "/admin-profile/user-refferals/:userName",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: PaymentSystemOverviewPage,
      path: "/admin-profile/payment-systems-overview",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: AdminBlogPage,
      path: "/admin-blog",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ],
)
class $AppRouter {}
