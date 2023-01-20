import 'package:flutter/material.dart';
import 'package:meta_app/core/di/configuration.dart';
import 'package:meta_app/storybook/storybook_app.dart';
import 'package:provider/provider.dart';

import 'presentation/pages/client_profile_page/client_tabs_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ClientTabsManager()),
    ],
    child: const StorybookApp(),
  ));
}
