import 'package:flutter/material.dart';

import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/pages/login_page.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

part 'components/auth_button.dart';
part 'components/locale_dropdown_menu.dart';
part 'components/menu_component.dart';
part 'components/mobile_menu_navigation.dart';
part 'components/navigation_button.dart';
part 'components/mobile_menu_content.dart';
part 'components/social_component.dart';
part 'components/special_info_component.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1270),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          if (context.screenWidth > 780)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _SpecialInfoComponent(),
                  Spacer(),
                  _AuthButton(),
                  SizedBox(width: 24),
                  _LocaleDropdownMenu(),
                  SizedBox(width: 90),
                ],
              ),
            ),
          if (context.screenWidth > 780) const Divider(),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.logo, height: 76),
                if (context.screenWidth > 780) const _MenuComponent(),
                if (context.screenWidth <= 780) const _MobileMenuNavigation(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/* 




 */
