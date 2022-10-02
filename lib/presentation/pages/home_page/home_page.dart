import 'package:flutter/material.dart';

import 'package:meta_app/presentation/widgets/gradient_button.dart';
import 'package:meta_app/presentation/widgets/header/header.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/gradient_text.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/sliver_sized_box.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

part 'sections/presentation_section.dart';
part 'sections/revelant_info_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: Header(screenWidth: context.screenWidth),
            pinned: true,
          ),
          const SliverSizedBox(height: 70),
          const SliverSizedBox(
            width: double.infinity,
            child: _PresentationSection(),
          ),
          const SliverSizedBox(
            height: 1700,
            width: double.infinity,
            child: ColoredBox(color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}
