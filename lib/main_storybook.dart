import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_app/core/di/configuration.dart';
import 'package:meta_app/presentation/blocs/client_profile_page/menu_cubit.dart';
import 'package:meta_app/storybook/storybook_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(BlocProvider(
    create: (context) => MenuCubit(),
    child: const StorybookApp(),
  ));
}
