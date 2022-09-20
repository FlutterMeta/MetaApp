import 'package:injectable/injectable.dart';
import 'package:meta_app/core/di/configuration.config.dart';
import 'package:meta_app/core/di/locator.dart';

@InjectableInit(
  initializerName: r'$configureDependencies',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() => $configureDependencies(locator);
