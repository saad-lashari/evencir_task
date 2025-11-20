import 'package:flutter/material.dart';

class Workout {
  final String icon;
  final String name;
  final String title;
  final String duration;
  final Color color;

  const Workout({
    required this.icon,
    required this.name,
    required this.title,
    required this.duration,
    required this.color,
  });

  Workout copyWith({
    String? icon,
    String? name,
    String? title,
    String? duration,
    Color? color,
  }) {
    return Workout(
      icon: icon ?? this.icon,
      name: name ?? this.name,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      color: color ?? this.color,
    );
  }
}