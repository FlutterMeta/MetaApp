import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/message_chip.dart';

import '../../../../core/mixins/message_overlay.dart';
import '../../../../data/models/product.dart';
import '../../../../data/models/result.dart';
import '../../../../domain/entities/subscription_tier.dart';
import '../../../providers/products_notifier.dart';

class ManageProductModal extends StatefulWidget {
  final Product? product;

  const ManageProductModal({
    this.product,
    Key? key,
  }) : super(key: key);

  @override
  State<ManageProductModal> createState() => ManageProductModalState();
}

class ManageProductModalState extends State<ManageProductModal>
    with MessageOverlay {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _subscriptionDurationController = TextEditingController();
  final _subscriptionTierController = TextEditingController();

  late ProductsNotifier _productNotifier;
  // final List<int> _subscriptionTierValues = [1, 2, 3];
  final List<int> _subscriptionTierValues = List.generate(
      int.parse(dotenv.env["BOT_TIERS_NUMBER"] ?? "3"), (index) => index + 1);

  int? _selectedSubscriptionTier;

  @override
  void initState() {
    super.initState();
    _productNotifier = context.read<ProductsNotifier>();
    if (widget.product != null) {
      _fillTextFields();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _subscriptionDurationController.dispose();
    _subscriptionTierController.dispose();
    super.dispose();
  }

  void _fillTextFields() {
    if (widget.product != null) {
      _titleController.text = widget.product?.title ?? "";
      _descriptionController.text = widget.product?.description ?? "";
      _priceController.text = widget.product?.price.toString() ?? "";
      _subscriptionDurationController.text =
          widget.product?.subscriptionDuration.toString() ?? "";

      _selectedSubscriptionTier =
          int.tryParse(widget.product?.subscriptionTier.value.toString() ?? "");
    }
  }

  Widget _buildSubscriptionTierDropdown() {
    return DropdownButton2<int>(
      value: _selectedSubscriptionTier,
      items: _subscriptionTierValues.map((int value) {
        String tierName =
            SubscriptionTier.values.firstWhere((e) => e.value == value).name;
        tierName = tierName.replaceFirst('SubscriptionTier.', '');

        return DropdownMenuItem<int>(
          value: value,
          child: Text(
              context.localizations.subscriptionTierValue(
                  tierName.substring(0, 1).toUpperCase() +
                      tierName.substring(1)),
              style: context.text.profileBotsDefault.copyWith(fontSize: 16)),
        );
      }).toList(),
      onChanged: (int? newValue) {
        setState(() {
          _selectedSubscriptionTier = newValue;
        });
      },
      dropdownMaxHeight: 200,
      dropdownWidth: 300,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: context.color.profilePageBackground,
      ),
      buttonHeight: 50,
      itemHeight: 40,
      underline: const SizedBox(),
      hint: Text(context.localizations.subscriptionTier,
          style: context.text.profileBotsDefault.copyWith(fontSize: 16)),
    );
  }

  void _handleProductUpdate(
    String title,
    String description,
    String price,
    String subscriptionDuration,
    String subscriptionTier,
  ) async {
    final product = Product(
      id: widget.product?.id ?? 0,
      title: title,
      description: description,
      price: double.parse(price),
      subscriptionDuration: int.parse(subscriptionDuration),
      subscriptionTier: SubscriptionTier.values
          .firstWhere((e) => e.value.toString() == subscriptionTier),
    );

    Result result = await _productNotifier.editProduct(product);

    if (result.success) {
      showMessage(
        context.localizations.editedSuccessfully,
        Colors.green,
      );
      Navigator.pop(context);
    } else {
      showMessage(
        "${context.localizations.error}: ${result.message}",
        Colors.red,
      );
    }
  }

  void _handleDelete(BuildContext context) async {
    Result result =
        await _productNotifier.deleteProduct(widget.product?.id ?? 0);

    if (result.success) {
      showMessage(
        context.localizations.deletedSuccessfully,
        Colors.green,
      );
      Navigator.pop(context);
    } else {
      showMessage(
        "${context.localizations.error}: ${result.message}",
        Colors.red,
      );
    }
  }

  void _handleOnTap(BuildContext context) async {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final price = _priceController.text;
    final subscriptionDuration = _subscriptionDurationController.text;

    if (title.isNotEmpty &&
        description.isNotEmpty &&
        price.isNotEmpty &&
        subscriptionDuration.isNotEmpty) {
      if (widget.product != null) {
        // Updating product cause one was passed to the modal
        _handleProductUpdate(
          title,
          description,
          price,
          subscriptionDuration,
          _selectedSubscriptionTier.toString(),
        );
      } else {
        // Creating new product
        final product = Product(
          id: 0,
          title: title,
          description: description,
          price: double.parse(price),
          subscriptionDuration: int.parse(subscriptionDuration),
          subscriptionTier: SubscriptionTier.values.firstWhere((e) =>
              e.value.toString() == _selectedSubscriptionTier.toString()),
        );

        Result result = await _productNotifier.addProduct(product);
        await _productNotifier.loadProducts();

        if (result.success) {
          showMessage(
            context.localizations.productAddedSuccessfully,
            Colors.green,
          );
          Navigator.pop(context);
        } else {
          showMessage(
            "${context.localizations.error}: ${result.message}",
            Colors.red,
          );
        }
      }
    } else {
      showMessage(
        context.localizations.fillAllFields,
        Colors.red,
      );
    }
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
            widget.product == null
                ? context.localizations.addNewProduct
                : context.localizations.editProduct,
            style: context.text.profileBotsDefault.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.localizations.productTitle,
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            controller: _titleController,
            decoration: InputDecoration(
              hintText: context.localizations.productTitle,
              hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: context.color.profilePagePrimary.withOpacity(0.1),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.localizations.productDescription,
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _descriptionController,
            minLines: 6,
            maxLines: 12,
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            decoration: InputDecoration(
              hintText: context.localizations.productDescription,
              hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: context.color.profilePagePrimary.withOpacity(0.1),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${context.localizations.price} (\$)",
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            controller: _priceController,
            decoration: InputDecoration(
              hintText: context.localizations.price,
              hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: context.color.profilePagePrimary.withOpacity(0.1),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.localizations.subscriptionDuration,
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            controller: _subscriptionDurationController,
            decoration: InputDecoration(
              hintText: context.localizations.subscriptionDuration,
              hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: context.color.profilePagePrimary.withOpacity(0.1),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.localizations.subscriptionTier,
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
          MessageChip.info(message: context.localizations.subscriptionTierInfo),
          const SizedBox(height: 10),
          Text(
            context.localizations.firstTheMostBasicAndLastTheMostAdvanced,
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
          ),
          _buildSubscriptionTierDropdown(),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.product != null)
                  ColoredButton(
                    title: context.localizations.delete,
                    onTap: () => _handleDelete(context),
                    color: context.color.profilePageError,
                  ),
                const Spacer(),
                ColoredButton(
                  title: context.localizations.cancel,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  color: context.color.greyish,
                ),
                const SizedBox(width: 20),
                ColoredButton(
                  title: widget.product == null
                      ? context.localizations.add
                      : context.localizations.edit,
                  onTap: () => _handleOnTap(context),
                  color: context.color.profilePagePrimary,
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
