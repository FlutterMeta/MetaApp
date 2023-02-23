import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/footer/footer.dart';
import 'package:meta_app/presentation/widgets/header/header.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/sliver_sized_box.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

import '../../../data/models/post.dart';
import 'admin_blog_controller.dart';

part 'sections/presentation_section.dart';
part 'sections/post_section.dart';
part 'sections/welcome_section.dart';
part 'sections/editable_post_area.dart';
part 'sections/preview_post_area.dart';
part 'sections/show_post_area.dart';
part './admin_blog_page.dart';

class BlogPage extends StatelessWidget {
  final _headerKey = GlobalKey();

  BlogPage({super.key});

  double _getHeaderYOffset() {
    final renderSliver =
        _headerKey.currentContext?.findRenderObject() as RenderSliver;

    final yOffset = renderSliver.constraints.precedingScrollExtent +
        (renderSliver.geometry?.scrollExtent ?? 0);
    return yOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            key: _headerKey,
            delegate: Header(
              headerYOffset: _getHeaderYOffset,
              screenWidth: context.screenWidth,
            ),
            pinned: true,
          ),
          const SliverSizedBox(height: 70),
          const SliverSizedBox(child: _PresentationSection()),
          const SliverSizedBox(height: 20),
          SliverSizedBox(child: _PostSection(post: examplePost)),
          const SliverSizedBox(height: 40),
          const SliverSizedBox(child: _WelcomeSection()),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}
