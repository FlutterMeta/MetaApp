import 'dart:convert';
import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/admin_profile/payment_systems_state_handler.dart';

import '../../../../data/models/payment_system.dart';
import '../../../constants/app_assets.dart';

class PaymentSystemModal extends StatefulWidget {
  final PaymentSystem? paymentSystem; // Pass null to create a new system

  const PaymentSystemModal({Key? key, this.paymentSystem}) : super(key: key);

  @override
  _PaymentSystemModalState createState() => _PaymentSystemModalState();
}

class _PaymentSystemModalState extends State<PaymentSystemModal> {
  late TextEditingController _titleController;
  late TextEditingController _keyController;
  String? _selectedImage;
  String? _selectedCryptoIcon;

  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: widget.paymentSystem?.title ?? '');
    _keyController =
        TextEditingController(text: widget.paymentSystem?.key ?? '');
    // Initialize selectedCryptoIcon based on the paymentSystem's image
    _selectedCryptoIcon = _getIconPathFromImage(widget.paymentSystem?.image);
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
      print("Error loading image: $e");
      return null;
    }
  }

  // Convert Uint8List image to key of the crypto icon
  String? _getIconPathFromImage(Uint8List? image) {
    // Implement your logic to determine the icon path from the image data
    // This placeholder function always returns null. You'll need actual logic here.
    return null;
  }

  void _savePaymentSystem() async {
    if (_titleController.text.isEmpty || _keyController.text.isEmpty) {
      // Handle error, show toast, or message
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
    );

    // Perform API call to create or update the system
    // Handle response and update state accordingly
    if (widget.paymentSystem == null) {
      // Create
      PaymentSystemsStateHandler.instance.addSystem(system);
    } else {
      // Update
      PaymentSystemsStateHandler.instance.editSystem(system);
    }

    // Close the modal
    Navigator.of(context).pop();
  }

  void _deletePaymentSystem() async {
    if (widget.paymentSystem != null) {
      // Perform API call to delete the system
      // Handle response and update state accordingly
    }

    // Close the modal
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
        padding: const EdgeInsets.all(32),
        child: Column(
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
                context.localizations.walletAddress,
                style: context.text.profileBotsDefault.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
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
                    hint: const Text(
                      'Select Crypto Icon',
                      style: TextStyle(
                        fontSize: 16, // Adjust the font size as needed
                        color: Colors.black, // Adjust the text color as needed
                      ),
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
                                  style: const TextStyle(
                                    fontSize:
                                        16, // Adjust the font size as needed
                                  ),
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
            const Spacer(),
            Row(
              children: [
                const SizedBox(height: 16),
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
                const Spacer(),
                if (widget.paymentSystem == null) ...[
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _savePaymentSystem,
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
                    child: Text(context.localizations.create),
                  ),
                ],
                const SizedBox(width: 16),
                if (widget.paymentSystem != null) ...[
                  ElevatedButton(
                    onPressed: _savePaymentSystem,
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
                    child: Text(context.localizations.edit),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _deletePaymentSystem,
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
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
