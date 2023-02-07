import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.profilePagePrimary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      width: Responsive.isDesktop(context)
          ? context.screenWidth * 0.4
          : context.screenWidth * 0.5,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: context.localizations.userSearch,
          hintStyle: context.text.headerNavItemHovered
              .copyWith(fontWeight: FontWeight.bold),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 14, right: 16),
            child: Icon(
              Icons.search_rounded,
              color: context.color.profilePagePrimary,
            ),
          ),
        ),
      ),
    );
  }
}
