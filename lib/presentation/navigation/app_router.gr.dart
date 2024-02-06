// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

import '../../data/models/user.dart' as _i19;
import '../pages/admin_profile/dashboard_page.dart' as _i13;
import '../pages/admin_profile/financial_indicators_page.dart' as _i11;
import '../pages/admin_profile/payment_system_overview_page.dart' as _i16;
import '../pages/admin_profile/transactions_page.dart' as _i14;
import '../pages/admin_profile/user_refferals_page.dart' as _i15;
import '../pages/admin_profile/user_transactions_page.dart' as _i12;
import '../pages/blog_page.dart/blog_page.dart' as _i6;
import '../pages/client_profile/client_profile_page.dart' as _i10;
import '../pages/directions_page/directions_page.dart' as _i7;
import '../pages/home_page/home_page.dart' as _i1;
import '../pages/login_page.dart' as _i2;
import '../pages/partners_page/partners_page.dart' as _i5;
import '../pages/products_page/products_page.dart' as _i4;
import '../pages/registration_page.dart' as _i3;
import '../pages/reset_access_page.dart' as _i9;
import '../pages/reset_password_page.dart' as _i8;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.RegistrationPage(),
      );
    },
    ProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsRouteArgs>(
          orElse: () => const ProductsRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ProductsPage(key: args.key),
      );
    },
    PartnersRoute.name: (routeData) {
      final args = routeData.argsAs<PartnersRouteArgs>(
          orElse: () => const PartnersRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.PartnersPage(key: args.key),
      );
    },
    BlogRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.BlogPage(),
      );
    },
    DirectionsRoute.name: (routeData) {
      final args = routeData.argsAs<DirectionsRouteArgs>(
          orElse: () => const DirectionsRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DirectionsPage(key: args.key),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ResetPasswordPage(),
      );
    },
    ResetAccessRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ResetAccessPage(),
      );
    },
    ClientProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ClientProfileRouteArgs>(
          orElse: () => const ClientProfileRouteArgs());
      return _i17.CustomPage<dynamic>(
        routeData: routeData,
        child: _i10.ClientProfilePage(key: args.key),
        transitionsBuilder: _i17.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FinancialIndicatorsRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.FinancialIndicatorsPage(),
      );
    },
    UserTransactionsRoute.name: (routeData) {
      final args = routeData.argsAs<UserTransactionsRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.UserTransactionsPage(
          user: args.user,
          userName: args.userName,
          showPendingTransactions: args.showPendingTransactions,
          key: args.key,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.DashboardPage(),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.TransactionsPage(),
      );
    },
    UserRefferalsRoute.name: (routeData) {
      final args = routeData.argsAs<UserRefferalsRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.UserRefferalsPage(
          user: args.user,
          userName: args.userName,
          key: args.key,
        ),
      );
    },
    PaymentSystemOverviewRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.PaymentSystemOverviewPage(),
      );
    },
    AdminBlogRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.AdminBlogPage(),
      );
    },
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i17.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i17.RouteConfig(
          RegistrationRoute.name,
          path: '/registration',
        ),
        _i17.RouteConfig(
          ProductsRoute.name,
          path: '/products',
        ),
        _i17.RouteConfig(
          PartnersRoute.name,
          path: '/partners',
        ),
        _i17.RouteConfig(
          BlogRoute.name,
          path: '/blog',
        ),
        _i17.RouteConfig(
          DirectionsRoute.name,
          path: '/directions',
        ),
        _i17.RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset-password',
        ),
        _i17.RouteConfig(
          ResetAccessRoute.name,
          path: '/reset-access',
        ),
        _i17.RouteConfig(
          ClientProfileRoute.name,
          path: '/profile',
        ),
        _i17.RouteConfig(
          FinancialIndicatorsRoute.name,
          path: '/admin-profile/financial-indicators',
        ),
        _i17.RouteConfig(
          UserTransactionsRoute.name,
          path: '/admin-profile/user-transactions/:userName',
        ),
        _i17.RouteConfig(
          DashboardRoute.name,
          path: '/admin-profile/dashboard',
        ),
        _i17.RouteConfig(
          TransactionsRoute.name,
          path: '/admin-profile/transactions',
        ),
        _i17.RouteConfig(
          UserRefferalsRoute.name,
          path: '/admin-profile/user-refferals/:userName',
        ),
        _i17.RouteConfig(
          PaymentSystemOverviewRoute.name,
          path: '/admin-profile/payment-systems-overview',
        ),
        _i17.RouteConfig(
          AdminBlogRoute.name,
          path: '/admin-blog',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i17.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i18.Key? key})
      : super(
          HomeRoute.name,
          path: '/home',
          args: HomeRouteArgs(key: key),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegistrationPage]
class RegistrationRoute extends _i17.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: '/registration',
        );

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i4.ProductsPage]
class ProductsRoute extends _i17.PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({_i18.Key? key})
      : super(
          ProductsRoute.name,
          path: '/products',
          args: ProductsRouteArgs(key: key),
        );

  static const String name = 'ProductsRoute';
}

class ProductsRouteArgs {
  const ProductsRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'ProductsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.PartnersPage]
class PartnersRoute extends _i17.PageRouteInfo<PartnersRouteArgs> {
  PartnersRoute({_i18.Key? key})
      : super(
          PartnersRoute.name,
          path: '/partners',
          args: PartnersRouteArgs(key: key),
        );

  static const String name = 'PartnersRoute';
}

class PartnersRouteArgs {
  const PartnersRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'PartnersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.BlogPage]
class BlogRoute extends _i17.PageRouteInfo<void> {
  const BlogRoute()
      : super(
          BlogRoute.name,
          path: '/blog',
        );

  static const String name = 'BlogRoute';
}

/// generated route for
/// [_i7.DirectionsPage]
class DirectionsRoute extends _i17.PageRouteInfo<DirectionsRouteArgs> {
  DirectionsRoute({_i18.Key? key})
      : super(
          DirectionsRoute.name,
          path: '/directions',
          args: DirectionsRouteArgs(key: key),
        );

  static const String name = 'DirectionsRoute';
}

class DirectionsRouteArgs {
  const DirectionsRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'DirectionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ResetPasswordPage]
class ResetPasswordRoute extends _i17.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(
          ResetPasswordRoute.name,
          path: '/reset-password',
        );

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i9.ResetAccessPage]
class ResetAccessRoute extends _i17.PageRouteInfo<void> {
  const ResetAccessRoute()
      : super(
          ResetAccessRoute.name,
          path: '/reset-access',
        );

  static const String name = 'ResetAccessRoute';
}

/// generated route for
/// [_i10.ClientProfilePage]
class ClientProfileRoute extends _i17.PageRouteInfo<ClientProfileRouteArgs> {
  ClientProfileRoute({_i18.Key? key})
      : super(
          ClientProfileRoute.name,
          path: '/profile',
          args: ClientProfileRouteArgs(key: key),
        );

  static const String name = 'ClientProfileRoute';
}

class ClientProfileRouteArgs {
  const ClientProfileRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'ClientProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.FinancialIndicatorsPage]
class FinancialIndicatorsRoute extends _i17.PageRouteInfo<void> {
  const FinancialIndicatorsRoute()
      : super(
          FinancialIndicatorsRoute.name,
          path: '/admin-profile/financial-indicators',
        );

  static const String name = 'FinancialIndicatorsRoute';
}

/// generated route for
/// [_i12.UserTransactionsPage]
class UserTransactionsRoute
    extends _i17.PageRouteInfo<UserTransactionsRouteArgs> {
  UserTransactionsRoute({
    required _i19.User user,
    required String userName,
    bool? showPendingTransactions = false,
    _i18.Key? key,
  }) : super(
          UserTransactionsRoute.name,
          path: '/admin-profile/user-transactions/:userName',
          args: UserTransactionsRouteArgs(
            user: user,
            userName: userName,
            showPendingTransactions: showPendingTransactions,
            key: key,
          ),
          rawPathParams: {'userName': userName},
        );

  static const String name = 'UserTransactionsRoute';
}

class UserTransactionsRouteArgs {
  const UserTransactionsRouteArgs({
    required this.user,
    required this.userName,
    this.showPendingTransactions = false,
    this.key,
  });

  final _i19.User user;

  final String userName;

  final bool? showPendingTransactions;

  final _i18.Key? key;

  @override
  String toString() {
    return 'UserTransactionsRouteArgs{user: $user, userName: $userName, showPendingTransactions: $showPendingTransactions, key: $key}';
  }
}

/// generated route for
/// [_i13.DashboardPage]
class DashboardRoute extends _i17.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/admin-profile/dashboard',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i14.TransactionsPage]
class TransactionsRoute extends _i17.PageRouteInfo<void> {
  const TransactionsRoute()
      : super(
          TransactionsRoute.name,
          path: '/admin-profile/transactions',
        );

  static const String name = 'TransactionsRoute';
}

/// generated route for
/// [_i15.UserRefferalsPage]
class UserRefferalsRoute extends _i17.PageRouteInfo<UserRefferalsRouteArgs> {
  UserRefferalsRoute({
    required _i19.User user,
    required String userName,
    _i18.Key? key,
  }) : super(
          UserRefferalsRoute.name,
          path: '/admin-profile/user-refferals/:userName',
          args: UserRefferalsRouteArgs(
            user: user,
            userName: userName,
            key: key,
          ),
          rawPathParams: {'userName': userName},
        );

  static const String name = 'UserRefferalsRoute';
}

class UserRefferalsRouteArgs {
  const UserRefferalsRouteArgs({
    required this.user,
    required this.userName,
    this.key,
  });

  final _i19.User user;

  final String userName;

  final _i18.Key? key;

  @override
  String toString() {
    return 'UserRefferalsRouteArgs{user: $user, userName: $userName, key: $key}';
  }
}

/// generated route for
/// [_i16.PaymentSystemOverviewPage]
class PaymentSystemOverviewRoute extends _i17.PageRouteInfo<void> {
  const PaymentSystemOverviewRoute()
      : super(
          PaymentSystemOverviewRoute.name,
          path: '/admin-profile/payment-systems-overview',
        );

  static const String name = 'PaymentSystemOverviewRoute';
}

/// generated route for
/// [_i6.AdminBlogPage]
class AdminBlogRoute extends _i17.PageRouteInfo<void> {
  const AdminBlogRoute()
      : super(
          AdminBlogRoute.name,
          path: '/admin-blog',
        );

  static const String name = 'AdminBlogRoute';
}
