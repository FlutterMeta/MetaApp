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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../pages/blog_page.dart/blog_page.dart' as _i6;
import '../pages/client_profile_page/client_profile_page.dart' as _i10;
import '../pages/directions_page/directions_page.dart' as _i7;
import '../pages/home_page/home_page.dart' as _i1;
import '../pages/login_page.dart' as _i2;
import '../pages/partners_page/partners_page.dart' as _i5;
import '../pages/products_page/products_page.dart' as _i4;
import '../pages/registration_page.dart' as _i3;
import '../pages/reset_access_page.dart' as _i9;
import '../pages/reset_password_page.dart' as _i8;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.RegistrationPage(),
      );
    },
    ProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsRouteArgs>(
          orElse: () => const ProductsRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ProductsPage(key: args.key),
      );
    },
    PartnersRoute.name: (routeData) {
      final args = routeData.argsAs<PartnersRouteArgs>(
          orElse: () => const PartnersRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.PartnersPage(key: args.key),
      );
    },
    BlogRoute.name: (routeData) {
      final args =
          routeData.argsAs<BlogRouteArgs>(orElse: () => const BlogRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.BlogPage(key: args.key),
      );
    },
    DirectionsRoute.name: (routeData) {
      final args = routeData.argsAs<DirectionsRouteArgs>(
          orElse: () => const DirectionsRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DirectionsPage(key: args.key),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ResetPasswordPage(),
      );
    },
    ResetAccessRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ResetAccessPage(),
      );
    },
    ClientProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ClientProfileRouteArgs>(
          orElse: () => const ClientProfileRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.ClientProfilePage(key: args.key),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i11.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i11.RouteConfig(
          RegistrationRoute.name,
          path: '/registration',
        ),
        _i11.RouteConfig(
          ProductsRoute.name,
          path: '/products',
        ),
        _i11.RouteConfig(
          PartnersRoute.name,
          path: '/partners',
        ),
        _i11.RouteConfig(
          BlogRoute.name,
          path: '/blog',
        ),
        _i11.RouteConfig(
          DirectionsRoute.name,
          path: '/directions',
        ),
        _i11.RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset-password',
        ),
        _i11.RouteConfig(
          ResetAccessRoute.name,
          path: '/reset-access',
        ),
        _i11.RouteConfig(
          ClientProfileRoute.name,
          path: '/client-profile',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i11.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i12.Key? key})
      : super(
          HomeRoute.name,
          path: '/home',
          args: HomeRouteArgs(key: key),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegistrationPage]
class RegistrationRoute extends _i11.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: '/registration',
        );

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i4.ProductsPage]
class ProductsRoute extends _i11.PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({_i12.Key? key})
      : super(
          ProductsRoute.name,
          path: '/products',
          args: ProductsRouteArgs(key: key),
        );

  static const String name = 'ProductsRoute';
}

class ProductsRouteArgs {
  const ProductsRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'ProductsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.PartnersPage]
class PartnersRoute extends _i11.PageRouteInfo<PartnersRouteArgs> {
  PartnersRoute({_i12.Key? key})
      : super(
          PartnersRoute.name,
          path: '/partners',
          args: PartnersRouteArgs(key: key),
        );

  static const String name = 'PartnersRoute';
}

class PartnersRouteArgs {
  const PartnersRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'PartnersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.BlogPage]
class BlogRoute extends _i11.PageRouteInfo<BlogRouteArgs> {
  BlogRoute({_i12.Key? key})
      : super(
          BlogRoute.name,
          path: '/blog',
          args: BlogRouteArgs(key: key),
        );

  static const String name = 'BlogRoute';
}

class BlogRouteArgs {
  const BlogRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'BlogRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.DirectionsPage]
class DirectionsRoute extends _i11.PageRouteInfo<DirectionsRouteArgs> {
  DirectionsRoute({_i12.Key? key})
      : super(
          DirectionsRoute.name,
          path: '/directions',
          args: DirectionsRouteArgs(key: key),
        );

  static const String name = 'DirectionsRoute';
}

class DirectionsRouteArgs {
  const DirectionsRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'DirectionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ResetPasswordPage]
class ResetPasswordRoute extends _i11.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(
          ResetPasswordRoute.name,
          path: '/reset-password',
        );

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i9.ResetAccessPage]
class ResetAccessRoute extends _i11.PageRouteInfo<void> {
  const ResetAccessRoute()
      : super(
          ResetAccessRoute.name,
          path: '/reset-access',
        );

  static const String name = 'ResetAccessRoute';
}

/// generated route for
/// [_i10.ClientProfilePage]
class ClientProfileRoute extends _i11.PageRouteInfo<ClientProfileRouteArgs> {
  ClientProfileRoute({_i12.Key? key})
      : super(
          ClientProfileRoute.name,
          path: '/client-profile',
          args: ClientProfileRouteArgs(key: key),
        );

  static const String name = 'ClientProfileRoute';
}

class ClientProfileRouteArgs {
  const ClientProfileRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'ClientProfileRouteArgs{key: $key}';
  }
}
