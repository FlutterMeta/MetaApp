import 'package:flutter/material.dart';
import 'package:meta_app/core/application.dart';
import 'package:meta_app/core/di/configuration.dart';
import 'package:meta_app/presentation/navigation/app_router.gr.dart';
import 'package:meta_app/presentation/redux/locale/actions/init_locale_action.dart';
import 'package:meta_app/presentation/redux/store.dart';
import 'package:meta_app/presentation/redux/theme/actions/init_theme_action.dart';
import 'package:provider/provider.dart';

import 'presentation/pages/client_profile_page/client_profile_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  final store = newStore();
  final appRouter = AppRouter();
  store.dispatch(InitThemeAction());
  store.dispatch(InitLocaleAction());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ClientProfileManager()),
      ],
      child: Application(store: store, appRouter: appRouter),
    ),
  );
}
