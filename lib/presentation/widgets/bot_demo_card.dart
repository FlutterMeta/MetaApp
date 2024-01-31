import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/simple_outlined_button.dart';
import '../../data/models/product.dart';
import '../pages/admin_profile/modals/manage_product_modal.dart';
import 'editing_field.dart';

class BotDemoCard extends StatefulWidget {
  final Product product;
  final VoidCallback onTap;

  const BotDemoCard({
    required this.product,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<BotDemoCard> createState() => _BotDemoCardState();
}

class _BotDemoCardState extends State<BotDemoCard> {
  final _priceController = TextEditingController();

  @override
  dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: Column(
        children: [
          Text(
            widget.product.title,
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 10),
          _PriceSection(
            price: widget.product.price,
            controller: _priceController,
          ),
          const SizedBox(height: 20),
          _BenefitSection(
            description: widget.product.description,
            duration: widget.product.subscriptionDuration,
          ),
          const Spacer(),
          SimpleOutlinedButton(
            onTap: widget.onTap,
            label: context.localizations.getStarted,
          ),
        ],
      ),
    );
  }
}

class EditableBotDemoCard extends StatefulWidget {
  final Product product;

  const EditableBotDemoCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  State<EditableBotDemoCard> createState() => _EditableBotDemoCardState();
}

class _EditableBotDemoCardState extends State<EditableBotDemoCard> {
  final _priceController = TextEditingController();
  bool _isEditing = false;

  void _handleOnTap(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ManageProductModal(product: product),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: Column(
        children: [
          Text(
            widget.product.title,
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 10),
          _PriceSection(
            price: widget.product.price,
            isEditing: _isEditing,
            controller: _priceController,
          ),
          const SizedBox(height: 20),
          _BenefitSection(
            description: widget.product.description,
            duration: widget.product.subscriptionDuration,
          ),
          const Spacer(),
          SimpleOutlinedButton(
            onTap: (() => _handleOnTap(context, widget.product)),
            label: context.localizations.edit,
          ),
        ],
      ),
    );
  }
}

class CardWrapper extends StatelessWidget {
  final Widget child;

  const CardWrapper({
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
        constraints:
            const BoxConstraints(maxWidth: 240, maxHeight: 380, minWidth: 210),
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
      ],
    );
  }
}

class _BenefitSection extends StatelessWidget {
  final String? description;
  final int? duration;

  const _BenefitSection({
    required this.description,
    required this.duration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${context.localizations.productDescription} :",
            style: context.text.profileBotsDefault.copyWith(fontSize: 12),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            description ?? "",
            style: context.text.profileBotsDefault.copyWith(fontSize: 14),
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                "${context.localizations.subscriptionDuration} :",
                style: context.text.profileBotsDefault.copyWith(fontSize: 12),
              ),
              const SizedBox(width: 10),
              Text(
                "$duration days",
                style: context.text.profileBotsDefault.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
