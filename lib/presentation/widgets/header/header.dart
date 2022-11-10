import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/di/locator.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/data/datasources/local/shared_prefs.dart';
import 'package:meta_app/l10n/app_locale.dart';
import 'package:meta_app/l10n/locale_manager.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/navigation/app_router.gr.dart';
import 'package:meta_app/presentation/widgets/media_buttons.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';
import 'package:useful_extensions/useful_extensions.dart';

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

  void _goToHomePage(BuildContext context) {
    context.router.navigate(HomeRoute());
  }

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

    return Container(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    _SpecialInfoComponent(),
                    Spacer(),
                    _BlogButton(),
                    SizedBox(width: 10),
                    _AccountButton(),
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
                  InkWell(
                    onTap: () => _goToHomePage(context),
                    child: Image.asset(AppAssets.auroraLogo, height: 76),
                  ),
                  if (width > 780) const _ExpandedMenu(),
                  if (width <= 780) _CompactMenu(headerYOffset: headerYOffset),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
