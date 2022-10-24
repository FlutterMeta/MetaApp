import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/themes/theme.dart';
import 'package:meta_app/presentation/widgets/footer/footer.dart';
import 'package:meta_app/presentation/widgets/gradient_button.dart';
import 'package:meta_app/presentation/widgets/header/header.dart';
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
          const SliverSizedBox(
            child: Align(child: _PresentationSection()),
          ),
          if (context.screenWidth > 780 + 16 * 2)
            const SliverSizedBox(height: 130),
          const SliverSizedBox(height: 40),
          SliverToBoxAdapter(
            child: Align(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                constraints: const BoxConstraints(maxWidth: 1270),
                child: const Divider(),
              ),
            ),
          ),
          const SliverSizedBox(height: 20),
          const SliverSizedBox(
            child: Align(child: _InvestorsSection()),
          ),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: _GradientSection()),
          const SliverSizedBox(height: 140),
          const SliverToBoxAdapter(child: Align(child: _ComponentsSection())),
          const SliverSizedBox(height: 100),
          SliverToBoxAdapter(
            child: Container(
              color: context.color.productsPartnersSectionBackground,
              padding: const EdgeInsets.symmetric(vertical: 100),
              alignment: Alignment.center,
              child: const _PartnersSection(),
            ),
          ),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: Align(child: _FaqSection())),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}
