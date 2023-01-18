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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../pages/blog_page.dart/blog_page.dart' as _i7;
import '../pages/client_dashboard_page/client_dashboard_page.dart' as _i9;
import '../pages/directions_page/directions_page.dart' as _i8;
import '../pages/forgot_password_page.dart' as _i4;
import '../pages/home_page/home_page.dart' as _i1;
import '../pages/login_page.dart' as _i2;
import '../pages/partners_page/partners_page.dart' as _i6;
import '../pages/products_page/products_page.dart' as _i5;
import '../pages/registration_page.dart' as _i3;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.RegistrationPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordPage(),
      );
    },
    ProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsRouteArgs>(
          orElse: () => const ProductsRouteArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.ProductsPage(key: args.key),
      );
    },
    PartnersRoute.name: (routeData) {
      final args = routeData.argsAs<PartnersRouteArgs>(
          orElse: () => const PartnersRouteArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.PartnersPage(key: args.key),
      );
    },
    BlogRoute.name: (routeData) {
      final args =
          routeData.argsAs<BlogRouteArgs>(orElse: () => const BlogRouteArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.BlogPage(key: args.key),
      );
    },
    DirectionsRoute.name: (routeData) {
      final args = routeData.argsAs<DirectionsRouteArgs>(
          orElse: () => const DirectionsRouteArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.DirectionsPage(key: args.key),
      );
    },
    ClientDashboardRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ClientDashboardPage(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/client-dashboard',
          fullMatch: true,
        ),
        _i10.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i10.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i10.RouteConfig(
          RegistrationRoute.name,
          path: '/registration',
        ),
        _i10.RouteConfig(
          ForgotPasswordRoute.name,
          path: '/forgot-password',
        ),
        _i10.RouteConfig(
          ProductsRoute.name,
          path: '/products',
        ),
        _i10.RouteConfig(
          PartnersRoute.name,
          path: '/partners',
        ),
        _i10.RouteConfig(
          BlogRoute.name,
          path: '/blog',
        ),
        _i10.RouteConfig(
          DirectionsRoute.name,
          path: '/directions',
        ),
        _i10.RouteConfig(
          ClientDashboardRoute.name,
          path: '/client-dashboard',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i10.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i11.Key? key})
      : super(
          HomeRoute.name,
          path: '/home',
          args: HomeRouteArgs(key: key),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegistrationPage]
class RegistrationRoute extends _i10.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: '/registration',
        );

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i10.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(
          ForgotPasswordRoute.name,
          path: '/forgot-password',
        );

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i5.ProductsPage]
class ProductsRoute extends _i10.PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({_i11.Key? key})
      : super(
          ProductsRoute.name,
          path: '/products',
          args: ProductsRouteArgs(key: key),
        );

  static const String name = 'ProductsRoute';
}

class ProductsRouteArgs {
  const ProductsRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'ProductsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.PartnersPage]
class PartnersRoute extends _i10.PageRouteInfo<PartnersRouteArgs> {
  PartnersRoute({_i11.Key? key})
      : super(
          PartnersRoute.name,
          path: '/partners',
          args: PartnersRouteArgs(key: key),
        );

  static const String name = 'PartnersRoute';
}

class PartnersRouteArgs {
  const PartnersRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'PartnersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.BlogPage]
class BlogRoute extends _i10.PageRouteInfo<BlogRouteArgs> {
  BlogRoute({_i11.Key? key})
      : super(
          BlogRoute.name,
          path: '/blog',
          args: BlogRouteArgs(key: key),
        );

  static const String name = 'BlogRoute';
}

class BlogRouteArgs {
  const BlogRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'BlogRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.DirectionsPage]
class DirectionsRoute extends _i10.PageRouteInfo<DirectionsRouteArgs> {
  DirectionsRoute({_i11.Key? key})
      : super(
          DirectionsRoute.name,
          path: '/directions',
          args: DirectionsRouteArgs(key: key),
        );

  static const String name = 'DirectionsRoute';
}

class DirectionsRouteArgs {
  const DirectionsRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'DirectionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ClientDashboardPage]
class ClientDashboardRoute extends _i10.PageRouteInfo<void> {
  const ClientDashboardRoute()
      : super(
          ClientDashboardRoute.name,
          path: '/client-dashboard',
        );

  static const String name = 'ClientDashboardRoute';
}
