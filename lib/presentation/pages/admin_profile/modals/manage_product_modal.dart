import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

import '../../../../core/global.dart';
import '../../../../core/mixins/message_overlay.dart';
import '../../../../data/models/product.dart';
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

  @override
  void initState() {
    super.initState();
    _productNotifier = ProductsNotifier();
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

      _subscriptionTierController.text =
          widget.product?.subscriptionTier.value.toString() ?? "";
    }
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

    await _productNotifier.editProduct(product);
    showMessage(
      context.localizations.editedSuccessfully,
      Colors.green,
    );
    Navigator.pop(context);
  }

  void _handleOnTap(BuildContext context) async {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final price = _priceController.text;
    final subscriptionDuration = _subscriptionDurationController.text;
    final subscriptionTier = _subscriptionTierController.text;

    if (title.isNotEmpty &&
        description.isNotEmpty &&
        price.isNotEmpty &&
        subscriptionDuration.isNotEmpty &&
        subscriptionTier.isNotEmpty) {
      if (widget.product != null) {
        // Updating product cause one was passed to the modal
        _handleProductUpdate(
          title,
          description,
          price,
          subscriptionDuration,
          subscriptionTier,
        );
      } else {
        // Creating new product
        final product = Product(
          id: 0,
          title: title,
          description: description,
          price: double.parse(price),
          subscriptionDuration: int.parse(subscriptionDuration),
          subscriptionTier: SubscriptionTier.values
              .firstWhere((e) => e.value.toString() == subscriptionTier),
        );

        await _productNotifier.addProduct(product);
        showMessage(
          context.localizations.productAddedSuccessfully,
          Colors.green,
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
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
          TextField(
            controller: _subscriptionTierController,
            decoration: InputDecoration(
              hintText: context.localizations.subscriptionTier,
              hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: context.color.profilePagePrimary.withOpacity(0.1),
            ),
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.product != null)
                  ElevatedButton(
                    onPressed: () async {
                      await _productNotifier
                          .deleteProduct(widget.product?.id ?? 0);
                      showMessage(
                        context.localizations.deletedSuccessfully,
                        Colors.green,
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.color.profilePageError,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(context.localizations.delete),
                  ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.color.profilePagePrimaryVariant,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(context.localizations.cancel),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _handleOnTap(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.color.profilePagePrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(widget.product == null
                      ? context.localizations.add
                      : context.localizations.edit),
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
