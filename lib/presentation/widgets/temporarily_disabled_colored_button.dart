import 'package:flutter/material.dart';
import 'dart:async';

import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

class TemporarilyDisabledColoredButton extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;
  final int disableDuration;

  const TemporarilyDisabledColoredButton({
    required this.title,
    required this.color,
    required this.onTap,
    this.disableDuration = 5,
    Key? key,
  }) : super(key: key);

  @override
  State<TemporarilyDisabledColoredButton> createState() =>
      _ColoredButtonState();
}

class _ColoredButtonState extends State<TemporarilyDisabledColoredButton> {
  Timer? _timer;
  int? _remainingSeconds;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      _remainingSeconds = widget.disableDuration;
    });

    _timer?.cancel(); // Cancel any previous timer.
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds! > 0) {
        setState(() {
          _remainingSeconds = _remainingSeconds! - 1;
        });
      } else {
        timer.cancel();
        setState(() {
          _remainingSeconds = null; // Resetting the counter.
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = _remainingSeconds != null;
    return InkWell(
      onTap: isDisabled
          ? null
          : () {
              widget.onTap();
            },
      child: Container(
        constraints: const BoxConstraints(minWidth: 128),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: isDisabled
              ? Colors.grey
              : widget.color, // Grey out when disabled.
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        clipBehavior: Clip.antiAlias,
        child: Text(
          isDisabled ? '${widget.title} ($_remainingSeconds)' : widget.title,
          textAlign: TextAlign.center,
          style: context.text.purpleButtonText.copyWith(
            color: isDisabled
                ? Colors.black
                : Colors.white, // Adjust text color for better visibility.
          ),
        ),
      ),
    );
  }
}
