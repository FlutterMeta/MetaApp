import 'package:flutter/material.dart';
import 'package:meta_app/presentation/widgets/demo_card.dart';

class BotDemoCard extends DemoCard {
  const BotDemoCard({
    required String title,
    required double price,
    required List<String> benefits,
    required bool editable,
    Key? key,
  }) : super(
          title: title,
          price: price,
          benefits: benefits,
          editable: editable,
          key: key,
        );

  factory BotDemoCard.client({
    required String title,
    required double price,
    required List<String> benefits,
  }) {
    return BotDemoCard(
      title: title,
      price: price,
      benefits: benefits,
      editable: false,
    );
  }
  factory BotDemoCard.admin({
    required String title,
    required double price,
    required List<String> benefits,
  }) {
    return BotDemoCard(
      title: title,
      price: price,
      benefits: benefits,
      editable: true,
    );
  }
}
