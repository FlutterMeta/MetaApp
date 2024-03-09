import 'package:flutter/material.dart';

class MessageChip extends StatelessWidget {
  final String message;
  final Color color;

  const MessageChip({
    required this.message,
    required this.color,
    Key? key,
  }) : super(key: key);

  factory MessageChip.warning({required String message}) => MessageChip(
        message: message,
        color: Colors.red,
      );

  factory MessageChip.info({required String message}) => MessageChip(
        message: message,
        color: Colors.blue,
      );

  factory MessageChip.success({required String message}) => MessageChip(
        message: message,
        color: Colors.green,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color.withOpacity(0.1),
      ),
      padding: const EdgeInsets.all(20),
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                Icons.warning_rounded,
                color: color,
              ),
            ),
            TextSpan(
              text: '  $message',
              style: TextStyle(color: color, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
