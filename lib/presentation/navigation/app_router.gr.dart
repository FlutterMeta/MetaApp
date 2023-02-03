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
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../pages/admin_profile_page/admin_profile_page.dart' as _i11;
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

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.RegistrationPage(),
      );
    },
    ProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsRouteArgs>(
          orElse: () => const ProductsRouteArgs());
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ProductsPage(key: args.key),
      );
    },
    PartnersRoute.name: (routeData) {
      final args = routeData.argsAs<PartnersRouteArgs>(
          orElse: () => const PartnersRouteArgs());
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.PartnersPage(key: args.key),
      );
    },
    BlogRoute.name: (routeData) {
      final args =
          routeData.argsAs<BlogRouteArgs>(orElse: () => const BlogRouteArgs());
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.BlogPage(key: args.key),
      );
    },
    DirectionsRoute.name: (routeData) {
      final args = routeData.argsAs<DirectionsRouteArgs>(
          orElse: () => const DirectionsRouteArgs());
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DirectionsPage(key: args.key),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ResetPasswordPage(),
      );
    },
    ResetAccessRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ResetAccessPage(),
      );
    },
    ClientProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ClientProfileRouteArgs>(
          orElse: () => const ClientProfileRouteArgs());
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.ClientProfilePage(key: args.key),
      );
    },
    AdminProfileRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.AdminProfilePage(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i12.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i12.RouteConfig(
          RegistrationRoute.name,
          path: '/registration',
        ),
        _i12.RouteConfig(
          ProductsRoute.name,
          path: '/products',
        ),
        _i12.RouteConfig(
          PartnersRoute.name,
          path: '/partners',
        ),
        _i12.RouteConfig(
          BlogRoute.name,
          path: '/blog',
        ),
        _i12.RouteConfig(
          DirectionsRoute.name,
          path: '/directions',
        ),
        _i12.RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset-password',
        ),
        _i12.RouteConfig(
          ResetAccessRoute.name,
          path: '/reset-access',
        ),
        _i12.RouteConfig(
          ClientProfileRoute.name,
          path: '/client-profile',
        ),
        _i12.RouteConfig(
          AdminProfileRoute.name,
          path: '/admin-profile',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i12.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i13.Key? key})
      : super(
          HomeRoute.name,
          path: '/home',
          args: HomeRouteArgs(key: key),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegistrationPage]
class RegistrationRoute extends _i12.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: '/registration',
        );

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i4.ProductsPage]
class ProductsRoute extends _i12.PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({_i13.Key? key})
      : super(
          ProductsRoute.name,
          path: '/products',
          args: ProductsRouteArgs(key: key),
        );

  static const String name = 'ProductsRoute';
}

class ProductsRouteArgs {
  const ProductsRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ProductsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.PartnersPage]
class PartnersRoute extends _i12.PageRouteInfo<PartnersRouteArgs> {
  PartnersRoute({_i13.Key? key})
      : super(
          PartnersRoute.name,
          path: '/partners',
          args: PartnersRouteArgs(key: key),
        );

  static const String name = 'PartnersRoute';
}

class PartnersRouteArgs {
  const PartnersRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'PartnersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.BlogPage]
class BlogRoute extends _i12.PageRouteInfo<BlogRouteArgs> {
  BlogRoute({_i13.Key? key})
      : super(
          BlogRoute.name,
          path: '/blog',
          args: BlogRouteArgs(key: key),
        );

  static const String name = 'BlogRoute';
}

class BlogRouteArgs {
  const BlogRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'BlogRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.DirectionsPage]
class DirectionsRoute extends _i12.PageRouteInfo<DirectionsRouteArgs> {
  DirectionsRoute({_i13.Key? key})
      : super(
          DirectionsRoute.name,
          path: '/directions',
          args: DirectionsRouteArgs(key: key),
        );

  static const String name = 'DirectionsRoute';
}

class DirectionsRouteArgs {
  const DirectionsRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'DirectionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ResetPasswordPage]
class ResetPasswordRoute extends _i12.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(
          ResetPasswordRoute.name,
          path: '/reset-password',
        );

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i9.ResetAccessPage]
class ResetAccessRoute extends _i12.PageRouteInfo<void> {
  const ResetAccessRoute()
      : super(
          ResetAccessRoute.name,
          path: '/reset-access',
        );

  static const String name = 'ResetAccessRoute';
}

/// generated route for
/// [_i10.ClientProfilePage]
class ClientProfileRoute extends _i12.PageRouteInfo<ClientProfileRouteArgs> {
  ClientProfileRoute({_i13.Key? key})
      : super(
          ClientProfileRoute.name,
          path: '/client-profile',
          args: ClientProfileRouteArgs(key: key),
        );

  static const String name = 'ClientProfileRoute';
}

class ClientProfileRouteArgs {
  const ClientProfileRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ClientProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.AdminProfilePage]
class AdminProfileRoute extends _i12.PageRouteInfo<void> {
  const AdminProfileRoute()
      : super(
          AdminProfileRoute.name,
          path: '/admin-profile',
        );

  static const String name = 'AdminProfileRoute';
}
