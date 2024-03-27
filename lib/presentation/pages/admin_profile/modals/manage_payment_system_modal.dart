import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta_app/core/global.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/providers/payment_systems_notifier.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:provider/provider.dart';

import '../../../../core/mixins/message_overlay.dart';
import '../../../../data/models/payment_system.dart';
import '../../../constants/app_assets.dart';

class PaymentSystemModal extends StatefulWidget {
  final PaymentSystem? paymentSystem; // Pass null to create a new system

  const PaymentSystemModal({Key? key, this.paymentSystem}) : super(key: key);

  @override
  PaymentSystemModalState createState() => PaymentSystemModalState();
}

class PaymentSystemModalState extends State<PaymentSystemModal>
    with MessageOverlay {
  late TextEditingController _titleController;
  late TextEditingController _keyController;
  late TextEditingController _networkController;
  late PaymentSystemNotifier _paymentSystemNotifier;

  String? _selectedCryptoIcon;

  @override
  void initState() {
    super.initState();
    _paymentSystemNotifier = context.read<PaymentSystemNotifier>();
    _titleController =
        TextEditingController(text: widget.paymentSystem?.title ?? '');
    _keyController =
        TextEditingController(text: widget.paymentSystem?.key ?? '');
    _networkController =
        TextEditingController(text: widget.paymentSystem?.network ?? '');
    if (widget.paymentSystem?.image != null) {
      // Here you might need actual logic to determine the corresponding icon from the image data
      // As a placeholder, using the first key from _cryptoIcons
      _selectedCryptoIcon = null;
    }
  }

  final Map<String, String> _cryptoIcons = {
    'Bitcoin': AppAssets.bitcoinIcon,
    'Ethereum': AppAssets.ethereumIcon,
    'Tether': AppAssets.tetherIcon,
    'USD Coin': AppAssets.usdCoinIcon,
    'DAI': AppAssets.daiIcon,
    'Binance Coin': AppAssets.binanceCoinIcon,
    'Dogecoin': AppAssets.dogecoinIcon,
  };
  @override
  void dispose() {
    _titleController.dispose();
    _keyController.dispose();
    super.dispose();
  }

  Future<Uint8List?> _loadImage(String assetPath) async {
    try {
      final ByteData data = await rootBundle.load(assetPath);
      final Uint8List bytes = data.buffer.asUint8List();
      return bytes;
    } catch (e) {
      debugPrint("Error loading image: $e");
      return null;
    }
  }

  void _savePaymentSystem() async {
    if (_titleController.text.isEmpty ||
        _keyController.text.isEmpty ||
        _selectedCryptoIcon == null ||
        _networkController.text.isEmpty) {
      showMessage(
        "${context.localizations.fillAllFields} ${context.localizations.and} ${context.localizations.chooseIcon.toLowerCase()}",
        context.color.profilePageError,
      );
      return;
    }

    // Load image bytes if a crypto icon is selected
    Uint8List? imageBytes;
    if (_selectedCryptoIcon != null) {
      String? imagePath = _cryptoIcons[_selectedCryptoIcon];
      if (imagePath != null) {
        imageBytes = await _loadImage(imagePath);
      }
    }

    final PaymentSystem system = PaymentSystem(
      id: widget.paymentSystem?.id ?? 0,
      title: _titleController.text,
      image: imageBytes, // Use the loaded image bytes
      key: _keyController.text,
      network: _networkController.text,
    );

    // Perform API call to create or update the system
    // Handle response and update state accordingly
    if (widget.paymentSystem == null) {
      // Create
      _paymentSystemNotifier.addSystem(system);
    } else {
      // Update
      _paymentSystemNotifier.editSystem(system);
    }

    // Close the modal
    Navigator.of(context).pop();
  }

  void _disablePaymentSystem() async {
    if (widget.paymentSystem != null) {
      // Perform API call to delete the system
      try {
        Response response = await apiRepository.patchPaymentSystem(
          widget.paymentSystem?.id ?? 0,
          {'enabled': false},
        );
        if (apiRepository.isSuccessfulStatusCode(response.statusCode)) {
          // PaymentSystemsStateHandler.instance
          //     .removeSystem(widget.paymentSystem as PaymentSystem);
          showMessage(
            context.localizations.paymentSystemSuccessfullyDisabled,
            context.color.okay,
          );
        } else {
          showMessage(
            "${context.localizations.error}: ${response.statusCode}",
            context.color.profilePageError,
          );
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    // Close the modal
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          color: context.color.profilePageBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.paymentSystem == null
                    ? context.localizations.addPaymentSystem
                    : context.localizations.edit,
                style: context.text.profileBotsDefault.copyWith(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.localizations.paymentSystemName,
                style: context.text.profileBotsDefault.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
              controller: _titleController,
              decoration: InputDecoration(
                hintText: context.localizations.paymentSystemName,
                hintStyle:
                    context.text.profileBotsDefault.copyWith(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: context.color.profilePagePrimary.withOpacity(0.1),
              ),
            ),
            const SizedBox(height: 26),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.localizations.network,
                style: context.text.profileBotsDefault.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
              controller: _networkController,
              decoration: InputDecoration(
                hintText: context.localizations.network,
                hintStyle:
                    context.text.profileBotsDefault.copyWith(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: context.color.profilePagePrimary.withOpacity(0.1),
              ),
            ),
            const SizedBox(height: 26),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.localizations.walletAddress,
                style: context.text.profileBotsDefault.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
              controller: _keyController,
              decoration: InputDecoration(
                hintText: "0x19323dEf2...",
                hintStyle:
                    context.text.profileBotsDefault.copyWith(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: context.color.profilePagePrimary.withOpacity(0.1),
              ),
            ),
            const SizedBox(height: 36),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: context.color.profilePagePrimary
                      .withOpacity(0.1), // Adjust the opacity as needed
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color:
                        context.color.profilePagePrimaryVariant, // Border color
                    width: 2,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    value: _selectedCryptoIcon,
                    hint: Text(
                      context.localizations.selectCryptoIcon,
                      style: context.text.profileBotsDefault
                          .copyWith(fontSize: 16),
                    ),
                    items: _cryptoIcons.entries
                        .map(
                          (entry) => DropdownMenuItem<String>(
                            value: entry.key,
                            child: Row(
                              children: [
                                Image.asset(entry.value, width: 24, height: 24),
                                const SizedBox(width: 8),
                                Text(
                                  entry.key,
                                  style: context.text.profileBotsDefault
                                      .copyWith(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCryptoIcon = value;
                      });
                    },
                    dropdownMaxHeight: 200, // Adjust the max height as needed
                    dropdownWidth: 200, // Adjust the width as needed
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // Border radius
                      color: Colors.white, // Dropdown background color
                    ),
                    buttonHeight: 50, // Adjust the height as needed
                    buttonWidth: 200, // Adjust the width as needed
                    itemHeight: 40, // Adjust the item height as needed
                  ),
                ),
              ),
            ),
            // const Spacer(),
            const SizedBox(height: 36),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 16),
                  ColoredButton(
                    title: context.localizations.cancel,
                    color: context.color.greyish,
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 16),
                  if (widget.paymentSystem == null) ...[
                    const SizedBox(width: 16),
                    ColoredButton(
                        title: context.localizations.create,
                        color: context.color.profilePagePrimary,
                        onTap: _savePaymentSystem),
                  ],
                  const SizedBox(width: 16),
                  if (widget.paymentSystem != null) ...[
                    ColoredButton(
                        title: context.localizations.save,
                        color: context.color.profilePagePrimary,
                        onTap: _savePaymentSystem),
                    const SizedBox(width: 16),
                    ColoredButton(
                        title: context.localizations.disable,
                        color: context.color.profilePageError,
                        onTap: _disablePaymentSystem),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
