import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../domain/entities/mood_data.dart';

class MoodWheelPainter extends CustomPainter {
  final Map<String, MoodData> moods;
  final String selectedMood;

  MoodWheelPainter({required this.moods, required this.selectedMood});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final innerRadius = radius * 0.43;
    final strokeWidth = radius - innerRadius;
    final gradientColors = [
      const Color(0xFFFF9B71), // Orange/Peach (0°)
      const Color(0xFFFFB870), // Orange-Yellow transition
      const Color(0xFFFFD76B), // Yellow (90°)
      const Color(0xFFB5E89F), // Yellow-Cyan transition
      const Color(0xFF7BE5C6), // Mint/Cyan (180°)
      const Color(0xFF9BBBDD), // Cyan-Purple transition
      const Color(0xFFB5A8F5), // Purple/Lavender (270°)
      const Color(0xFFD89FD5), // Purple-Pink transition
      const Color(0xFFFF8FB5), // Pink (bottom)
      const Color(0xFFFF94A0), // Pink-Orange transition
      const Color(0xFFFF9B71), // Back to orange for seamless loop
    ];
    final gradientPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt
      ..shader =
          SweepGradient(
            colors: gradientColors,
            startAngle: 0,
            endAngle: math.pi * 2,
            tileMode: TileMode.clamp,
          ).createShader(
            Rect.fromCircle(center: center, radius: (radius + innerRadius) / 2),
          );

    canvas.drawCircle(center, (radius + innerRadius) / 2, gradientPaint);

    final glowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth + 4
      ..shader =
          SweepGradient(
            colors: gradientColors
                .map((c) => c.withValues(alpha: 0.3))
                .toList(),
            startAngle: 0,
            endAngle: math.pi * 2,
            tileMode: TileMode.clamp,
          ).createShader(
            Rect.fromCircle(center: center, radius: (radius + innerRadius) / 2),
          )
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    canvas.drawCircle(center, (radius + innerRadius) / 2, glowPaint);
  }

  @override
  bool shouldRepaint(covariant MoodWheelPainter oldDelegate) {
    return oldDelegate.selectedMood != selectedMood;
  }
}
