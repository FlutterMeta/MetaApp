import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/data/models/payment_system.dart';
import 'package:meta_app/core/mixins/message_overlay.dart';
import 'package:meta_app/data/models/product.dart';
import 'package:meta_app/presentation/pages/client_profile/sections/transaction_tab.dart';
import 'package:meta_app/presentation/providers/payment_systems_notifier.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/payment_system_card.dart';
import 'package:provider/provider.dart';

class ChoosePaymentSystemModal extends StatefulWidget {
  final Product product;
  const ChoosePaymentSystemModal({Key? key, required this.product})
      : super(key: key);

  @override
  State<ChoosePaymentSystemModal> createState() =>
      ChoosePaymentSystemModalState();
}

class ChoosePaymentSystemModalState extends State<ChoosePaymentSystemModal>
    with MessageOverlay {
  ValueNotifier<int?> selectedSystemId = ValueNotifier<int?>(null);
  late PaymentSystemNotifier paymentSystemsNotifier;

  @override
  void initState() {
    paymentSystemsNotifier = context.read<PaymentSystemNotifier>();
    super.initState();
  }

  @override
  void dispose() {
    selectedSystemId.dispose();
    super.dispose();
  }

  void _handleOnTap() async {
    if (selectedSystemId.value == null) {
      showMessage(
        context.localizations.choosePaymentSystem,
        context.color.profilePageError,
      );
      return;
    }
    Navigator.of(context).pop(selectedSystemId.value);

    PaymentSystem paymentSystem =
        await paymentSystemsNotifier.loadSystemById(selectedSystemId.value!);

    showDialog(
      context: context,
      builder: (_) => Center(
        child: SingleChildScrollView(
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: TransactionTab(
              product: widget.product,
              paymentSystem: paymentSystem,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      constraints: const BoxConstraints(maxWidth: 600),
      decoration: BoxDecoration(
        color: context.color.profilePageBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localizations.choosePaymentSystem,
            style: context.text.profileBotsDefault.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder<int?>(
            valueListenable: selectedSystemId,
            builder: (context, selectedId, child) {
              return Consumer<PaymentSystemNotifier>(
                builder: (context, paymentSystemNotifier, _) {
                  return paymentSystemNotifier.systems.isEmpty
                      ? Center(
                          child: Text(
                            context.localizations.noPaymentSystems,
                            style: context.text.profileBotsDefault.copyWith(
                              fontSize: 22,
                              color: context.color.profilePagePrimaryVariant,
                            ),
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1.2, // Aspect ratio of each item
                          ),
                          itemCount: paymentSystemNotifier.systems.length,
                          itemBuilder: (context, index) {
                            var system = paymentSystemNotifier.systems[index];
                            bool isSelected =
                                selectedSystemId.value == system.id;
                            return SmallPaymentSystemCard(
                              paymentSystem: system,
                              onTap: () {
                                setState(() {
                                  selectedSystemId.value = system.id;
                                });
                              },
                              selected: isSelected,
                            );
                          },
                        );
                },
              );
            },
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ColoredButton(
                  title: context.localizations.cancel,
                  onTap: () => Navigator.of(context).pop(),
                  color: context.color.greyish,
                ),
                ColoredButton(
                  title: context.localizations.confirm,
                  onTap: _handleOnTap,
                  color: context.color.profilePagePrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
