import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/l10n/l10n.dart';
import 'package:meta_app/presentation/navigation/app_router.gr.dart';
import 'package:meta_app/presentation/navigation/router_observer.dart';
import 'package:meta_app/presentation/themes/theme.dart';
import 'package:meta_app/presentation/widgets/auth_button.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';
import 'package:meta_app/presentation/widgets/gradient_button.dart';
import 'package:meta_app/presentation/widgets/gradient_text.dart';
import 'package:meta_app/presentation/widgets/media_buttons.dart';
import 'package:meta_app/presentation/widgets/sliver_sized_box.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

part 'build_context_ext.dart';
part "stories/buttons.dart";
part "stories/pages.dart";
part "stories/widgets.dart";

class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) => Storybook(
        plugins: initializePlugins(
          contentsSidePanel: true,
          enableContents: true,
          knobsSidePanel: true,
          enableThemeMode: false,
        ),
        stories: [
          ..._pages,
          ..._widgets,
          ..._buttons,
        ],
        initialStory: "Pages/Home",
      );
}

class RouterAwareStory extends Story {
  RouterAwareStory({
    required String name,
    required List<PageRouteInfo> initialRoutes,
    required AppRouter router,
  }) : super(
          name: name,
          wrapperBuilder: (context, child) => child as Widget,
          builder: (context) => MaterialApp.router(
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: createLightTheme(),
            darkTheme: createDarkTheme(),
            routerDelegate: AutoRouterDelegate(
              router,
              initialRoutes: initialRoutes,
              navigatorObservers: () => [RouterObserver()],
            ),
            routeInformationParser: router.defaultRouteParser(),
          ),
        );
}

class CustomMaterialAppWrapper extends StatelessWidget {
  final Widget child;

  const CustomMaterialAppWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) => MaterialApp(
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        theme: createLightTheme(),
        darkTheme: createDarkTheme(),
        home: child,
      );
}
