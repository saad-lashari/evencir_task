import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../domain/entities/mood_data.dart';
import 'mood_wheel_painter.dart';

class MoodWheelWidget extends StatefulWidget {
  final Map<String, MoodData> moods;
  final String selectedMood;
  final Function(String) onMoodChanged;

  const MoodWheelWidget({
    super.key,
    required this.moods,
    required this.selectedMood,
    required this.onMoodChanged,
  });

  @override
  State<MoodWheelWidget> createState() => _MoodWheelWidgetState();
}

class _MoodWheelWidgetState extends State<MoodWheelWidget> {
  bool isDragging = false;
  double currentAngle = 0.5;
  static const double containerSize = 280.0;
  static const double wheelSize = 230.0;
  static const double centerFaceSize = 170.0;
  static double indicatorSize = 57.5.h;
  static const double wheelRadius = 100.0;

  @override
  void initState() {
    super.initState();
    currentAngle = widget.moods[widget.selectedMood]!.angle;
  }

  @override
  void didUpdateWidget(MoodWheelWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!isDragging && oldWidget.selectedMood != widget.selectedMood) {
      currentAngle = widget.moods[widget.selectedMood]!.angle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        setState(() {
          isDragging = true;
        });
        _updateMoodFromPosition(details.localPosition);
      },
      onPanUpdate: (details) {
        _updateMoodFromPosition(details.localPosition);
      },
      onPanEnd: (details) {
        setState(() {
          isDragging = false;
        });
      },
      onTapDown: (details) {
        _updateMoodFromPosition(details.localPosition);
      },
      child: SizedBox(
        width: containerSize,
        height: containerSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(wheelSize, wheelSize),
              painter: MoodWheelPainter(
                moods: widget.moods,
                selectedMood: widget.selectedMood,
              ),
            ),
            _buildCenterFace(),
            _buildIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterFace() {
    return Container(
      width: centerFaceSize,
      height: centerFaceSize,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 2,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(_getMoodEmoji(), width: 110.w, height: 110.h),
      ),
    );
  }

  Widget _buildIndicator() {
    final position = _getIndicatorPosition();

    return Positioned(
      left: position.dx - (indicatorSize / 2),
      top: position.dy - (indicatorSize / 2),
      child: Container(
        width: indicatorSize,
        height: indicatorSize,
        decoration: BoxDecoration(
          color: AppColors.textTertiary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: widget.moods[widget.selectedMood]!.color.withValues(
                alpha: 0.5,
              ),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ],
        ),
      ),
    );
  }

  String _getMoodEmoji() {
    switch (widget.selectedMood) {
      case 'content':
        return AppImages.contentSvg;
      case 'peaceful':
        return AppImages.peacefulSvg;
      case 'happy':
        return AppImages.happySvg;
      case 'calm':
        return AppImages.calmSvg;
      default:
        return AppImages.contentSvg;
    }
  }

  Offset _getIndicatorPosition() {
    final angleInRadians = currentAngle * 2 * math.pi;
    final centerX = containerSize / 2;
    final centerY = containerSize / 2;
    final x = centerX + wheelRadius * math.cos(angleInRadians);
    final y = centerY + wheelRadius * math.sin(angleInRadians);
    return Offset(x, y);
  }

  String _getMoodFromAngle(double normalizedAngle) {
    if (normalizedAngle >= 0.875 || normalizedAngle < 0.125) {
      return 'content';
    } else if (normalizedAngle >= 0.125 && normalizedAngle < 0.375) {
      return 'peaceful';
    } else if (normalizedAngle >= 0.375 && normalizedAngle < 0.625) {
      return 'happy';
    } else {
      return 'calm';
    }
  }

  void _updateMoodFromPosition(Offset position) {
    final center = const Offset(containerSize / 2, containerSize / 2);
    final dx = position.dx - center.dx;
    final dy = position.dy - center.dy;
    final distance = math.sqrt(dx * dx + dy * dy);
    final innerLimit = centerFaceSize / 2;
    final outerLimit = wheelSize / 2;
    if (distance > innerLimit && distance < outerLimit) {
      var angle = math.atan2(dy, dx);
      if (angle < 0) angle += 2 * math.pi;
      final normalizedAngle = angle / (2 * math.pi);
      setState(() {
        currentAngle = normalizedAngle;
      });
      final newMood = _getMoodFromAngle(normalizedAngle);
      if (newMood != widget.selectedMood) {
        widget.onMoodChanged(newMood);
      }
    }
  }
}
