import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/client_profile/menu_controller.dart';
import 'package:meta_app/presentation/widgets/simple_outlined_button.dart';
import 'editing_field.dart';

class BotDemoCard extends StatefulWidget {
  final String title;
  final double price;
  final List<String> benefits;

  const BotDemoCard({
    required this.title,
    required this.price,
    required this.benefits,
    Key? key,
  }) : super(key: key);

  @override
  State<BotDemoCard> createState() => _BotDemoCardState();
}

class _BotDemoCardState extends State<BotDemoCard> {
  final _priceController = TextEditingController();

  void _pushTransactionTab() {
    const int transactionTabIndex = 2;
    MenuController.tabIndex.value = transactionTabIndex;
  }

  @override
  dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _CardWrapper(
      child: Column(
        children: [
          Text(
            widget.title,
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 10),
          _PriceSection(
            price: widget.price,
            controller: _priceController,
          ),
          const SizedBox(height: 20),
          _BenefitSection(benefits: widget.benefits),
          const Spacer(),
          SimpleOutlinedButton(
            onTap: _pushTransactionTab,
            label: context.localizations.getStarted,
          ),
        ],
      ),
    );
  }
}

class EditableBotDemoCard extends StatefulWidget {
  final String title;
  final double price;
  final List<String> benefits;

  const EditableBotDemoCard({
    required this.title,
    required this.price,
    required this.benefits,
    Key? key,
  }) : super(key: key);

  @override
  State<EditableBotDemoCard> createState() => _EditableBotDemoCardState();
}

class _EditableBotDemoCardState extends State<EditableBotDemoCard> {
  final _priceController = TextEditingController();
  bool _isEditing = false;

  void _onConfirm() {
    _priceController.text;
    _priceController.clear();
    setState(() => _isEditing = false);
  }

  @override
  Widget build(BuildContext context) {
    return _CardWrapper(
      child: Column(
        children: [
          Text(
            widget.title,
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 10),
          _PriceSection(
            price: widget.price,
            isEditing: _isEditing,
            controller: _priceController,
          ),
          const SizedBox(height: 20),
          _BenefitSection(benefits: widget.benefits),
          const Spacer(),
          _isEditing
              ? SimpleOutlinedButton(
                  onTap: _onConfirm,
                  label: context.localizations.confirmChanges,
                )
              : SimpleOutlinedButton(
                  onTap: () => setState(() => _isEditing = !_isEditing),
                  label: context.localizations.edit,
                ),
        ],
      ),
    );
  }
}

class _CardWrapper extends StatelessWidget {
  final Widget child;

  const _CardWrapper({
    required this.child,
    Key? key,
  }) : super(key: key);

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
        child: child,
      ),
    );
  }
}

class _PriceSection extends StatelessWidget {
  final double price;
  final bool? isEditing;
  final TextEditingController controller;

  const _PriceSection({
    required this.price,
    this.isEditing = false,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 18,
          alignment: Alignment.bottomCenter,
          child: Text(
            "\$",
            style: context.text.profileBotsDefault.copyWith(fontSize: 12),
          ),
        ),
        isEditing as bool
            ? EditingField(
                value: price.toString(),
                width: 80,
                controller: controller,
              )
            : Text(
                "$price",
                style: context.text.profileBotsDefault.copyWith(fontSize: 24),
              ),
        Container(
          height: 26,
          alignment: Alignment.bottomCenter,
          child: Text(
            "/${context.localizations.monthShortened}",
            style: context.text.profileBotsDefault.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class _BenefitSection extends StatelessWidget {
  final List<String> benefits;

  const _BenefitSection({
    required this.benefits,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}

/* class BotBotDemoCard extends BotDemoCard {
  const BotBotDemoCard({
    required String title,
    required double price,
    required List<String> benefits,
    required bool editable,
    Key? key,
  }) : super(
          title: title,
          price: price,
          benefits: benefits,
          editable: editable,
          key: key,
        );

  factory BotBotDemoCard.client({
    required String title,
    required double price,
    required List<String> benefits,
  }) {
    return BotBotDemoCard(
      title: title,
      price: price,
      benefits: benefits,
      editable: false,
    );
  }
  factory BotBotDemoCard.admin({
    required String title,
    required double price,
    required List<String> benefits,
  }) {
    return BotBotDemoCard(
      title: title,
      price: price,
      benefits: benefits,
      editable: true,
    );
  }
}
 */