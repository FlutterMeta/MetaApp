import 'package:flutter/material.dart';
import 'package:meta_app/presentation/widgets/message_chip.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: MessageChip.info(
                  message:
                      'This is an info message. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
            ),
          ],
        ),
      ),
    ),
  );
}
