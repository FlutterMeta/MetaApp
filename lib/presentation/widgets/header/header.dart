import 'package:flutter/material.dart';

import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/pages/login_page.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';
import 'package:meta_app/route_observer.dart';

part 'components/account_button.dart';
part 'components/locale_dropdown.dart';
part 'components/expanded_menu.dart';
part 'components/compact_menu.dart';
part 'components/navigation_button.dart';
part 'components/social_component.dart';
part 'components/special_info_component.dart';

class Header extends SliverPersistentHeaderDelegate {
  final double screenWidth;

  Header({required this.screenWidth});

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
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
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
                  Image.asset(AppAssets.logo, height: 76),
                  if (width > 780) const _ExpandedMenu(),
                  if (width <= 780) const _CompactMenu(),
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
