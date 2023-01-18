import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Image.asset(
              AppAssets.auroraLogo,
              height: 78,
            ),
            SizedBox(
              width: context.screenWidth * 0.02,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu_rounded),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble_outline_rounded),
            ),
            SizedBox(
              width: context.screenWidth * 0.08,
            ),
            const _UserInfo(
              userName: "Bobr123",
              email: "adwdawdwa@gmail.com",
            ),
          ],
        ),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  final String email;
  final String userName;

  const _UserInfo({
    required this.email,
    required this.userName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const welcomeStyle = TextStyle(fontSize: 16);
    const emailStyle = TextStyle(fontSize: 12, color: Color(0xFF464A53));
    const userNameStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    return Row(
      children: [
        if (Responsive.isDesktop(context)) ...[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(context.localizations.welcome, style: welcomeStyle),
                  Text(userName, style: userNameStyle),
                ],
              ),
              const SizedBox(height: 4),
              Text(email, style: emailStyle),
            ],
          ),
        ] else
          Text(userName, style: userNameStyle),
        Icon(
          Icons.account_circle,
          size: Responsive.isDesktop(context) ? 80 : 50,
          color: context.color.partnersCardBackground,
        ),
      ],
    );
  }
}
