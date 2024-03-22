import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/data/models/blog.dart';
import 'package:meta_app/l10n/app_locale.dart';
import 'package:meta_app/l10n/l10n.dart';
import 'package:meta_app/presentation/navigation/app_router.gr.dart';
import 'package:meta_app/presentation/navigation/router_observer.dart';
import 'package:meta_app/presentation/providers/blogs_notifier.dart';
import 'package:meta_app/presentation/providers/levels_notifier.dart';
import 'package:meta_app/presentation/providers/products_notifier.dart';
import 'package:meta_app/presentation/providers/users_notifier.dart';
import 'package:meta_app/presentation/redux/app_state.dart';
import 'package:meta_app/presentation/themes/theme.dart';
import 'package:meta_app/presentation/widgets/web_scroll_behaviour.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  final Store<AppState> store;
  final AppRouter appRouter;

  const Application({
    required this.store,
    required this.appRouter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreConnector<AppState, _ViewModel>(
        vm: () => _Factory(this),
        builder: (BuildContext context, _ViewModel vm) => Portal(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider<UsersNotifier>(
                create: (context) => UsersNotifier()..loadUsers(),
              ),
              ChangeNotifierProvider<ProductsNotifier>(
                create: ((context) => ProductsNotifier()..loadProducts()),
              ),
              ChangeNotifierProvider<LevelsNotifier>(
                create: ((context) => LevelsNotifier()..loadLevels()),
              ),
              ChangeNotifierProvider<BlogsNotifier>(
                create: ((context) => BlogsNotifier()..loadBlogs()),
              ),
            ],
            child: MaterialApp.router(
              scrollBehavior: WebScrollBehaviour(),
              locale: vm.appLocale.locale,
              supportedLocales: L10n.all,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              theme: createLightTheme(),
              darkTheme: createDarkTheme(),
              themeMode: vm.themeMode,
              routerDelegate: AutoRouterDelegate(
                appRouter,
                initialRoutes: [HomeRoute()],
                navigatorObservers: () => [RouterObserver()],
              ),
              routeInformationParser: appRouter.defaultRouteParser(),
            ),
          ),
        ),
      ),
    );
  }
}

class _Factory extends VmFactory<AppState, Application> {
  _Factory(widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel(
        themeMode: state.themeMode,
        appLocale: state.appLocale,
      );
}

class _ViewModel extends Vm {
  final ThemeMode themeMode;
  final AppLocale appLocale;

  _ViewModel({
    required this.themeMode,
    required this.appLocale,
  }) : super(equals: [themeMode, appLocale]);
}
