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
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;

import '../pages/admin_profile/dashboard_page.dart' as _i13;
import '../pages/admin_profile/financial_indicators_page.dart' as _i11;
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
import '../widgets/user_table/user_table.dart' as _i18;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.RegistrationPage(),
      );
    },
    ProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsRouteArgs>(
          orElse: () => const ProductsRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ProductsPage(key: args.key),
      );
    },
    PartnersRoute.name: (routeData) {
      final args = routeData.argsAs<PartnersRouteArgs>(
          orElse: () => const PartnersRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.PartnersPage(key: args.key),
      );
    },
    BlogRoute.name: (routeData) {
      final args =
          routeData.argsAs<BlogRouteArgs>(orElse: () => const BlogRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.BlogPage(key: args.key),
      );
    },
    DirectionsRoute.name: (routeData) {
      final args = routeData.argsAs<DirectionsRouteArgs>(
          orElse: () => const DirectionsRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DirectionsPage(key: args.key),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ResetPasswordPage(),
      );
    },
    ResetAccessRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ResetAccessPage(),
      );
    },
    ClientProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ClientProfileRouteArgs>(
          orElse: () => const ClientProfileRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.ClientProfilePage(key: args.key),
      );
    },
    FinancialIndicatorsRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.FinancialIndicatorsPage(),
      );
    },
    UserTransactionsRoute.name: (routeData) {
      final args = routeData.argsAs<UserTransactionsRouteArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.UserTransactionsPage(
          user: args.user,
          key: args.key,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.DashboardPage(),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.TransactionsPage(),
      );
    },
    UserRefferalsRoute.name: (routeData) {
      final args = routeData.argsAs<UserRefferalsRouteArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.UserRefferalsPage(
          user: args.user,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i16.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i16.RouteConfig(
          RegistrationRoute.name,
          path: '/registration',
        ),
        _i16.RouteConfig(
          ProductsRoute.name,
          path: '/products',
        ),
        _i16.RouteConfig(
          PartnersRoute.name,
          path: '/partners',
        ),
        _i16.RouteConfig(
          BlogRoute.name,
          path: '/blog',
        ),
        _i16.RouteConfig(
          DirectionsRoute.name,
          path: '/directions',
        ),
        _i16.RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset-password',
        ),
        _i16.RouteConfig(
          ResetAccessRoute.name,
          path: '/reset-access',
        ),
        _i16.RouteConfig(
          ClientProfileRoute.name,
          path: '/client-profile',
        ),
        _i16.RouteConfig(
          FinancialIndicatorsRoute.name,
          path: '/admin-profile/financial-indicators',
        ),
        _i16.RouteConfig(
          UserTransactionsRoute.name,
          path: '/admin-profile/user-transactions',
        ),
        _i16.RouteConfig(
          DashboardRoute.name,
          path: '/admin-profile/dashboard',
        ),
        _i16.RouteConfig(
          TransactionsRoute.name,
          path: '/admin-profile/transactions',
        ),
        _i16.RouteConfig(
          UserRefferalsRoute.name,
          path: '/admin-profile/user-refferals',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i16.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i17.Key? key})
      : super(
          HomeRoute.name,
          path: '/home',
          args: HomeRouteArgs(key: key),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegistrationPage]
class RegistrationRoute extends _i16.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: '/registration',
        );

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i4.ProductsPage]
class ProductsRoute extends _i16.PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({_i17.Key? key})
      : super(
          ProductsRoute.name,
          path: '/products',
          args: ProductsRouteArgs(key: key),
        );

  static const String name = 'ProductsRoute';
}

class ProductsRouteArgs {
  const ProductsRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'ProductsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.PartnersPage]
class PartnersRoute extends _i16.PageRouteInfo<PartnersRouteArgs> {
  PartnersRoute({_i17.Key? key})
      : super(
          PartnersRoute.name,
          path: '/partners',
          args: PartnersRouteArgs(key: key),
        );

  static const String name = 'PartnersRoute';
}

class PartnersRouteArgs {
  const PartnersRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'PartnersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.BlogPage]
class BlogRoute extends _i16.PageRouteInfo<BlogRouteArgs> {
  BlogRoute({_i17.Key? key})
      : super(
          BlogRoute.name,
          path: '/blog',
          args: BlogRouteArgs(key: key),
        );

  static const String name = 'BlogRoute';
}

class BlogRouteArgs {
  const BlogRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'BlogRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.DirectionsPage]
class DirectionsRoute extends _i16.PageRouteInfo<DirectionsRouteArgs> {
  DirectionsRoute({_i17.Key? key})
      : super(
          DirectionsRoute.name,
          path: '/directions',
          args: DirectionsRouteArgs(key: key),
        );

  static const String name = 'DirectionsRoute';
}

class DirectionsRouteArgs {
  const DirectionsRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'DirectionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ResetPasswordPage]
class ResetPasswordRoute extends _i16.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(
          ResetPasswordRoute.name,
          path: '/reset-password',
        );

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i9.ResetAccessPage]
class ResetAccessRoute extends _i16.PageRouteInfo<void> {
  const ResetAccessRoute()
      : super(
          ResetAccessRoute.name,
          path: '/reset-access',
        );

  static const String name = 'ResetAccessRoute';
}

/// generated route for
/// [_i10.ClientProfilePage]
class ClientProfileRoute extends _i16.PageRouteInfo<ClientProfileRouteArgs> {
  ClientProfileRoute({_i17.Key? key})
      : super(
          ClientProfileRoute.name,
          path: '/client-profile',
          args: ClientProfileRouteArgs(key: key),
        );

  static const String name = 'ClientProfileRoute';
}

class ClientProfileRouteArgs {
  const ClientProfileRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'ClientProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.FinancialIndicatorsPage]
class FinancialIndicatorsRoute extends _i16.PageRouteInfo<void> {
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
    extends _i16.PageRouteInfo<UserTransactionsRouteArgs> {
  UserTransactionsRoute({
    required _i18.User user,
    _i17.Key? key,
  }) : super(
          UserTransactionsRoute.name,
          path: '/admin-profile/user-transactions',
          args: UserTransactionsRouteArgs(
            user: user,
            key: key,
          ),
        );

  static const String name = 'UserTransactionsRoute';
}

class UserTransactionsRouteArgs {
  const UserTransactionsRouteArgs({
    required this.user,
    this.key,
  });

  final _i18.User user;

  final _i17.Key? key;

  @override
  String toString() {
    return 'UserTransactionsRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i13.DashboardPage]
class DashboardRoute extends _i16.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/admin-profile/dashboard',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i14.TransactionsPage]
class TransactionsRoute extends _i16.PageRouteInfo<void> {
  const TransactionsRoute()
      : super(
          TransactionsRoute.name,
          path: '/admin-profile/transactions',
        );

  static const String name = 'TransactionsRoute';
}

/// generated route for
/// [_i15.UserRefferalsPage]
class UserRefferalsRoute extends _i16.PageRouteInfo<UserRefferalsRouteArgs> {
  UserRefferalsRoute({
    required _i18.User user,
    _i17.Key? key,
  }) : super(
          UserRefferalsRoute.name,
          path: '/admin-profile/user-refferals',
          args: UserRefferalsRouteArgs(
            user: user,
            key: key,
          ),
        );

  static const String name = 'UserRefferalsRoute';
}

class UserRefferalsRouteArgs {
  const UserRefferalsRouteArgs({
    required this.user,
    this.key,
  });

  final _i18.User user;

  final _i17.Key? key;

  @override
  String toString() {
    return 'UserRefferalsRouteArgs{user: $user, key: $key}';
  }
}
