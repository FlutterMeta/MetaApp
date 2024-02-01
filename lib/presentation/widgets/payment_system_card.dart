import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

import '../../data/models/payment_system.dart';

class PaymentSystemCard extends StatelessWidget {
  final PaymentSystem paymentSystem;
  final VoidCallback onTap;

  const PaymentSystemCard({
    Key? key,
    required this.paymentSystem,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _cardWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.color.profilePagePrimary.withOpacity(0.1),
        ),
        constraints: BoxConstraints(
          minWidth: Responsive.isMobile(context) ? 700 : 500,
          maxWidth: Responsive.isMobile(context) ? 700 : 500,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                paymentSystem.image == null ||
                        paymentSystem.image?.isEmpty == true
                    ? const Icon(Icons.payment, size: 40)
                    : Image.memory(
                        Uint8List.fromList(paymentSystem.image ?? []),
                        width: 40,
                        height: 40,
                      ),
                const SizedBox(width: 16),
                Text(paymentSystem.title),
              ],
            ),
            const SizedBox(height: 16),
            SelectableText(paymentSystem.key),
          ],
        ),
      ),
    );
  }
}

class SmallPaymentSystemCard extends StatelessWidget {
  final PaymentSystem paymentSystem;
  final VoidCallback onTap;
  final bool selected;

  const SmallPaymentSystemCard({
    Key? key,
    required this.paymentSystem,
    this.selected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _cardWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.color.profilePagePrimary.withOpacity(0.1),
          border: selected // Check if the card is selected
              ? Border.all(color: Colors.yellow, width: 3)
              : null,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 8,
        ), // Reduced padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            paymentSystem.image == null || paymentSystem.image?.isEmpty == true
                ? const Icon(
                    Icons.payment,
                    size: 40,
                  ) // Icon size can remain the same
                : Image.memory(
                    Uint8List.fromList(paymentSystem.image ?? []),
                    width: 40, // Icon width
                    height: 40, // Icon height
                  ),
            const SizedBox(height: 8), // Reduced space
            Text(
              paymentSystem.title,
              textAlign: TextAlign.center,
              style: // Reduced font size
                  context.text.profileBotsDefault.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

double _cardWidth(BuildContext context) {
  if (Responsive.isMobile(context)) {
    return context.screenWidth * 0.9;
  } else if (context.screenWidth <= 1240) {
    return context.screenWidth * 0.4;
  } else {
    return context.screenWidth * 0.16;
  }
}
