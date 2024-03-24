import 'package:flutter/material.dart';
import 'package:meta_app/core/di/locator.dart';
import 'package:meta_app/data/datasources/local/shared_prefs.dart';
import 'package:meta_app/presentation/themes/theme.dart';
import 'package:meta_app/presentation/themes/theme_manager.dart';

class DayNightIcon extends StatefulWidget {
  const DayNightIcon({Key? key}) : super(key: key);

  @override
  DayNightIconState createState() => DayNightIconState();
}

class DayNightIconState extends State<DayNightIcon> {
  late bool _isDarkMode;

  void _onDayNightPressed(BuildContext context) {
    ThemeManager.switchTheme(context);
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  final _dayIcon = Icons.wb_sunny;
  final _nightIcon = Icons.nightlight_round;

  @override
  void initState() {
    super.initState();
    _isDarkMode = locator<SharedPrefs>().getThemeMode() == ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isDarkMode ? _dayIcon : _nightIcon,
        color: _isDarkMode ? AppColors.white : AppColors.black,
      ),
      onPressed: () => _onDayNightPressed(context),
    );
  }
}
