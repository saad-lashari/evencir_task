import 'package:flutter/material.dart';

class MoodData {
  final String label;
  final Color color;
  final double angle;

  const MoodData({
    required this.label,
    required this.color,
    required this.angle,
  });

  MoodData copyWith({String? label, Color? color, double? angle}) {
    return MoodData(
      label: label ?? this.label,
      color: color ?? this.color,
      angle: angle ?? this.angle,
    );
  }
}
