import 'package:flutter/material.dart';
import 'package:meta_app/core/di/configuration.dart';
import 'package:meta_app/storybook/storybook_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const StorybookApp());
}
