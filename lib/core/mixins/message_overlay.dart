import 'package:flutter/material.dart';

import '../../presentation/widgets/responsive.dart';

mixin MessageOverlay<T extends StatefulWidget> on State<T> {
  void showMessage(String message, Color color) async {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        right: 16,
        bottom: 16,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Material(
            elevation: 10.0,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 20),
              color: color,
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(width: 20),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: Responsive.isMobile(context) ? 300 : 500),
                    child: Text(
                      message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Automatically remove the overlay after 3 seconds
    await Future.delayed(const Duration(seconds: 4));
    overlayEntry.remove();
  }
}
