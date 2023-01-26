import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_app/core/application.dart';
import 'package:meta_app/core/di/configuration.dart';
import 'package:meta_app/presentation/blocs/client_profile_page/menu_cubit.dart';
import 'package:meta_app/presentation/navigation/app_router.gr.dart';
import 'package:meta_app/presentation/redux/locale/actions/init_locale_action.dart';
import 'package:meta_app/presentation/redux/store.dart';
import 'package:meta_app/presentation/redux/theme/actions/init_theme_action.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  final store = newStore();
  final appRouter = AppRouter();
  store.dispatch(InitThemeAction());
  store.dispatch(InitLocaleAction());
  runApp(
    BlocProvider(
      create: (_) => MenuCubit(),
      child: Application(store: store, appRouter: appRouter),
    ),
  );
}
