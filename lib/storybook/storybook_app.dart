import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/l10n/l10n.dart';
import 'package:meta_app/presentation/pages/blog_page.dart/blog_page.dart';
import 'package:meta_app/presentation/pages/directions_page/directions_page.dart';
import 'package:meta_app/presentation/pages/forgot_password_page.dart';
import 'package:meta_app/presentation/pages/home_page/home_page.dart';
import 'package:meta_app/presentation/pages/login_page.dart';
import 'package:meta_app/presentation/pages/products_page/products_page.dart';
import 'package:meta_app/presentation/pages/partners_page/partners_page.dart';
import 'package:meta_app/presentation/pages/registration_page.dart';
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

void main() {
  runApp(const StorybookApp());
}

class StorybookApp extends StatelessWidget {
  const StorybookApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: createLightTheme(),
        darkTheme: createDarkTheme(),
        home: Storybook(
          wrapperBuilder: (context, child) => Container(child: child),
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
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: L10n.all,
      );
}
