import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: 'Mulish',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: _textTheme,
    );
  }

  static final TextTheme _textTheme = TextTheme(
    // Display styles - Large titles
    displayLarge: TextStyle(
      color: AppColors.textTertiary,
      fontSize: 40.sp,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      color: AppColors.textTertiary,
      fontSize: 32.sp,
      fontWeight: FontWeight.w400,
    ),

    // Headline styles - Section headers
    headlineLarge: TextStyle(
      color: AppColors.textTertiary,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: AppColors.textTertiary,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      color: AppColors.textTertiary,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
    ),

    titleLarge: TextStyle(
      color: AppColors.textTertiary,
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: AppColors.textTertiary,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),

    // Body styles - Regular text
    bodyLarge: TextStyle(
      color: AppColors.textTertiary,
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      color: AppColors.textVariantSecondary,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: AppColors.textTertiary,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),

    // Label styles - Small labels, captions
    labelLarge: TextStyle(
      color: AppColors.textTertiary,
      fontSize: 24.sp,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      color: AppColors.textTertiary,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
    ),
    labelSmall: TextStyle(
      color: AppColors.textTertiary,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
    ),
  );

  // Custom text styles for specific use cases
  static TextStyle sectionTitle = TextStyle(
    color: AppColors.textTertiary,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle cardTitle = TextStyle(
    color: AppColors.textTertiary,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle cardSubtitle = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
  );

  static const TextStyle metricValue = TextStyle(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle metricLabel = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle navLabel = TextStyle(fontSize: 12);

  static const TextStyle dateText = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  static const TextStyle weekIndicator = TextStyle(fontSize: 14);
}
