import 'package:flutter/material.dart';
import 'package:meta_app/presentation/widgets/gradient_button.dart';
import 'package:meta_app/presentation/widgets/header/header.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/gradient_text.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

part 'sections/presentation_section.dart';
part 'sections/revelant_info_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: PreferredSize(
        preferredSize: Size(1270, context.screenWidth > 780 ? 180 : 106),
        child: const Header(),
      ), */
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: const [
              Header(),
              SizedBox(height: 70),
              _PresentationSection(),
            ],
          ),
        ),
      ),
    );
  }
}
