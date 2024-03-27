import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/admin_profile/payment_systems_state_handler.dart';

import '../../../data/models/payment_system.dart';
import '../../widgets/payment_system_card.dart';
import '../../widgets/profile_header/profile_header.dart';
import '../../widgets/responsive.dart';
import '../../widgets/rights_reserved_footer.dart';
import 'modals/manage_payment_system_modal.dart';

class PaymentSystemOverviewPage extends StatefulWidget {
  const PaymentSystemOverviewPage({super.key});

  @override
  State<PaymentSystemOverviewPage> createState() =>
      _PaymentSystemOverviewPageState();
}

class _PaymentSystemOverviewPageState extends State<PaymentSystemOverviewPage> {
  void _showPaymentSystemModal(PaymentSystem? paymentSystem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(child: PaymentSystemModal(paymentSystem: paymentSystem));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    PaymentSystemsStateHandler.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.admin(),
      backgroundColor: context.color.profilePageBackground,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Text(
                context.localizations.paymentSystemManagement,
                style: context.text.profileBotsDefault.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                context.localizations.tapOnCardToEditIt,
                style: context.text.profileBotsDefault.copyWith(fontSize: 15),
              ),
              const SizedBox(height: 30),
              ValueListenableBuilder(
                valueListenable: PaymentSystemsStateHandler.controller,
                builder: (_, __, ___) {
                  return Wrap(spacing: 20, runSpacing: 16, children: [
                    ...PaymentSystemsStateHandler.instance.systems
                        .map((system) => PaymentSystemCard(
                              paymentSystem: system,
                              onTap: () => _showPaymentSystemModal(
                                system,
                              ), // pass the payment system to edit
                            ))
                        .toList(),
                    const AddSystemCard(),
                  ]);
                },
              ),
              const Align(
                alignment: Alignment.center,
                child: RightsReservedFooter(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class AddSystemCard extends StatefulWidget {
  const AddSystemCard({Key? key}) : super(key: key);

  @override
  State<AddSystemCard> createState() => _AddSystemCardState();
}

class _AddSystemCardState extends State<AddSystemCard> {
  void _showPaymentSystemModal(PaymentSystem? paymentSystem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(child: PaymentSystemModal(paymentSystem: paymentSystem));
      },
    );
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPaymentSystemModal(
        null,
      ), // null to add a new system
      child: Container(
        height: 112,
        width: _cardWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.color.profilePagePrimary.withOpacity(0.1),
        ),
        constraints: BoxConstraints(
          minWidth: 200,
          maxWidth: Responsive.isMobile(context) ? 500 : 300,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              context.localizations.addPaymentSystem,
              style: context.text.askButton,
            ),
            Icon(Icons.add, color: context.color.profilePagePrimary, size: 40),
          ],
        ),
      ),
    );
  }
}
