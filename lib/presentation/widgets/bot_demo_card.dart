import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/client_profile/menu_controller.dart';

class BotDemoCard extends StatelessWidget {
  final String title;
  final double price;
  final List<String> benefits;

  const BotDemoCard({
    required this.title,
    required this.price,
    required this.benefits,
    Key? key,
  }) : super(key: key);

  void _pushTransactionTab() {
    const int transactionTabIndex = 2;
    MenuController.tabIndex.value = transactionTabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.profilePageBackground,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: context.color.profilePagePrimary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 240, maxHeight: 340),
        child: Column(
          children: [
            Text(
              title,
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 18,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "\$",
                    style:
                        context.text.profileBotsDefault.copyWith(fontSize: 12),
                  ),
                ),
                Text(
                  "$price",
                  style: context.text.profileBotsDefault.copyWith(fontSize: 24),
                ),
                Container(
                  height: 26,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "/${context.localizations.monthShortened}",
                    style:
                        context.text.profileBotsDefault.copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...benefits.map(
              (benefit) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        benefit,
                        style: context.text.profileBotsDefault.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            _GetStartedButton(onTap: _pushTransactionTab),
          ],
        ),
      ),
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  final VoidCallback onTap;

  const _GetStartedButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: context.color.greyish),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localizations.getStarted,
              style: context.text.profilePageBody.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
