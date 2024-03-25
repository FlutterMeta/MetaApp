import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/admin_profile/payment_systems_state_handler.dart';
import 'package:meta_app/core/mixins/message_overlay.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/message_chip.dart';
import 'package:meta_app/presentation/widgets/payment_system_card.dart';

// PaymentSystem for Withdraw
class ChoosePaymentSystemModal extends StatefulWidget {
  final ValueNotifier<int?> selectedSystemId;
  final VoidCallback onTap;

  const ChoosePaymentSystemModal({
    Key? key,
    required this.onTap,
    required this.selectedSystemId,
  }) : super(key: key);

  @override
  State<ChoosePaymentSystemModal> createState() =>
      ChoosePaymentSystemModalState();
}

class ChoosePaymentSystemModalState extends State<ChoosePaymentSystemModal>
    with MessageOverlay {
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
          MessageChip.warning(
              message: context.localizations.networkChoosingTip),
          const SizedBox(height: 10),
          MessageChip.info(message: context.localizations.walletChooseTip),
          const SizedBox(height: 20),
          ValueListenableBuilder<int?>(
            valueListenable: widget.selectedSystemId,
            builder: (context, selectedId, child) {
              return ValueListenableBuilder(
                valueListenable: PaymentSystemsStateHandler.controller,
                builder: (context, value, child) {
                  return PaymentSystemsStateHandler.instance.systems.isEmpty
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
                          itemCount: PaymentSystemsStateHandler
                              .instance.systems.length,
                          itemBuilder: (context, index) {
                            var system = PaymentSystemsStateHandler
                                .instance.systems[index];
                            bool isSelected =
                                widget.selectedSystemId.value == system.id;
                            return SmallPaymentSystemCard(
                              paymentSystem: system,
                              onTap: () => setState(() =>
                                  widget.selectedSystemId.value = system.id),
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
                  onTap: widget.onTap,
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
