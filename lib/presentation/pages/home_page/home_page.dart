import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/core/utils/extensions/date_time_ext.dart';
import 'package:meta_app/presentation/pages/home_page/sections/video_section.dart';
import 'package:meta_app/presentation/widgets/footer/footer.dart';
import 'package:meta_app/presentation/widgets/gradient_button.dart';
import 'package:meta_app/presentation/widgets/gradient_text.dart';
import 'package:meta_app/presentation/widgets/header/header.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/sliver_sized_box.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

part 'sections/presentation_section.dart';
part 'sections/trusted_section.dart';
part 'sections/cards_section.dart';
part 'sections/investment_partnership_section.dart';
part 'sections/revenue_section.dart';

class HomePage extends StatelessWidget {
  final _headerKey = GlobalKey();

  HomePage({super.key});

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
          const SliverSizedBox(height: 70),
          const SliverSizedBox(child: _PresentationSection()),
          const SliverSizedBox(height: 60),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: VideoSection(),
              ),
            ),
          ),
          const SliverSizedBox(height: 100),
          const SliverSizedBox(child: _InvestmentPartnershipSection()),
          const SliverSizedBox(height: 114),
          const SliverSizedBox(child: _CardsSection()),
          const SliverSizedBox(height: 100),
          const SliverSizedBox(child: _TrustedSection()),
          const SliverSizedBox(height: 116),
          const SliverSizedBox(child: _RevenueSection()),
          const SliverSizedBox(height: 120),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}
