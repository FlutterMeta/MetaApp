import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/footer/footer.dart';
import 'package:meta_app/presentation/widgets/gradient_button.dart';
import 'package:meta_app/presentation/widgets/header/header.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/sliver_sized_box.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

part 'sections/presentation_section.dart';
part 'sections/investors_section.dart';
part 'sections/gradient_section.dart';
part 'sections/components_section.dart';
part 'sections/partners_section.dart';
part 'sections/faq_section.dart';

class ProductsPage extends StatelessWidget {
  final _headerKey = GlobalKey();

  ProductsPage({super.key});

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
          const SliverSizedBox(child: Align(child: _PresentationSection())),
          if (context.screenWidth > 812) const SliverSizedBox(height: 130),
          const SliverSizedBox(height: 40),
          const SliverToBoxAdapter(child: Align(child: _Divider())),
          const SliverSizedBox(height: 20),
          const SliverSizedBox(child: Align(child: _InvestorsSection())),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: _GradientSection()),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: Align(child: _ComponentsSection())),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: _PartnersSection()),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: Align(child: _FaqSection())),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      constraints: const BoxConstraints(maxWidth: 1270),
      child: const Divider(),
    );
  }
}
