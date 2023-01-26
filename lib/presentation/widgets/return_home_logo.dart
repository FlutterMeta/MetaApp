import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/navigation/app_router.gr.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

class ReturnHomeLogo extends StatelessWidget {
  final double height;

  const ReturnHomeLogo({
    required this.height,
    Key? key,
  }) : super(key: key);

  void _goToHomePage(BuildContext context) {
    context.router.navigate(HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return WebButton(
      onTap: () => _goToHomePage(context),
      child: Image.asset(AppAssets.auroraLogo, height: height),
    );
  }
}
