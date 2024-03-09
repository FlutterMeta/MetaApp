import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/di/locator.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/data/datasources/local/shared_prefs.dart';
import 'package:meta_app/l10n/app_locale.dart';
import 'package:meta_app/l10n/locale_manager.dart';
import 'package:meta_app/presentation/navigation/app_router.gr.dart';
import 'package:meta_app/presentation/themes/theme.dart';
import 'package:meta_app/presentation/widgets/return_home_logo.dart';
import 'package:meta_app/presentation/widgets/media_buttons.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:useful_extensions/useful_extensions.dart';
import '../../../data/models/user.dart';
import '../../redux/app_state.dart';
import '../../themes/theme_manager.dart';
part 'components/account_button.dart';
part 'components/compact_menu.dart';
part 'components/expanded_menu.dart';
part 'components/locale_dropdown.dart';
part 'components/navigation_button.dart';
part 'components/special_info_component.dart';
part 'components/blog_button.dart';

class Header extends SliverPersistentHeaderDelegate {
  final double screenWidth;
  final double Function() headerYOffset;

  Header({
    required this.screenWidth,
    required this.headerYOffset,
  });

  @override
  double get minExtent => screenWidth > 780 ? 190 : 120;

  @override
  double get maxExtent => minExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final width = context.screenWidth;

    return PointerInterceptor(
      child: Container(
        decoration: BoxDecoration(
          color: context.color.headerBackground,
          boxShadow: [
            BoxShadow(
              color: context.color.headerShadow,
              spreadRadius: 4,
              blurRadius: 6,
            ),
          ],
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1270),
          child: Column(
            children: [
              if (width > 780) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _SpecialInfoComponent(),
                      Spacer(),
                      _BlogButton(),
                      SizedBox(width: 10),
                      _AccountButton(),
                      SizedBox(width: 24),
                      DayNightIcon(),
                      SizedBox(width: 24),
                      _LocaleDropdown(),
                      SizedBox(width: 90),
                    ],
                  ),
                ),
                const Divider(),
              ],
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ReturnHomeLogo(height: 76),
                    if (width > 780)
                      const Material(
                        color: Colors.transparent,
                        child: _ExpandedMenu(),
                      ),
                    if (width <= 780)
                      Material(
                        child: _CompactMenu(headerYOffset: headerYOffset),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

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
