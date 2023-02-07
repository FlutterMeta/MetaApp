import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/client_profile/menu_controller.dart';
import 'package:meta_app/presentation/widgets/simple_outlined_button.dart';

class DemoCard extends StatefulWidget {
  final String title;
  final double price;
  final List<String> benefits;
  final bool editable;

  const DemoCard({
    required this.title,
    required this.price,
    required this.benefits,
    required this.editable,
    Key? key,
  }) : super(key: key);

  @override
  State<DemoCard> createState() => _DemoCardState();
}

class _DemoCardState extends State<DemoCard> {
  bool _isEditing = false;
  final _priceController = TextEditingController();

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
              widget.title,
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
                _isEditing
                    ? _EditingField(
                        price: widget.price,
                        controller: _priceController,
                      )
                    : Text(
                        "${widget.price}",
                        style: context.text.profileBotsDefault
                            .copyWith(fontSize: 24),
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
            _BenefitSection(benefits: widget.benefits),
            const Spacer(),
            if (!widget.editable)
              SimpleOutlinedButton(
                onTap: _pushTransactionTab,
                label: context.localizations.getStarted,
              ),
            if (widget.editable) ...[
              _isEditing
                  ? SimpleOutlinedButton(
                      onTap: () {
                        _priceController.text; //do something with the new price
                        _priceController.clear();
                        setState(() => _isEditing = !_isEditing);
                      },
                      label: context.localizations.confirmChanges,
                    )
                  : SimpleOutlinedButton(
                      onTap: () {
                        setState(() => _isEditing = !_isEditing);
                      },
                      label: context.localizations.edit,
                    ),
            ],
          ],
        ),
      ),
    );
  }
}

class _EditingField extends StatelessWidget {
  final double price;
  final TextEditingController controller;

  const _EditingField({
    required this.price,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: context.color.profilePagePrimary.withOpacity(0.2),
        filled: true,
        hintText: "$price",
        hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 24),
        constraints: const BoxConstraints(
          maxWidth: 80,
          maxHeight: 30,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 6,
        ),
      ),
      style: context.text.profileBotsDefault.copyWith(fontSize: 24),
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
