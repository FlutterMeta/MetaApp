import 'package:flutter/material.dart';
import 'package:meta_app/presentation/widgets/simple_card.dart';

class LevelCard extends SimpleCard {
  const LevelCard({
    required int level,
    required double reward,
    required bool editable,
    Key? key,
  }) : super(
          level: level,
          reward: reward,
          editable: editable,
          key: key,
        );

  factory LevelCard.client({
    required int level,
    required double reward,
  }) {
    return LevelCard(
      level: level,
      reward: reward,
      editable: false,
    );
  }

  factory LevelCard.admin({
    required int level,
    required double reward,
  }) {
    return LevelCard(
      level: level,
      reward: reward,
      editable: true,
    );
  }
}
