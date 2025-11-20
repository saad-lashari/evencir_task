import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';

class MonthSelectorWidget extends StatelessWidget {
  final DateTime currentMonth;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;

  const MonthSelectorWidget({
    super.key,
    required this.currentMonth,
    required this.onPreviousMonth,
    required this.onNextMonth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, color: AppColors.textTertiary),
            onPressed: onPreviousMonth,
          ),
          Text(
            DateFormat('MMM yyyy').format(currentMonth),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          IconButton(
            icon: const Icon(
              Icons.chevron_right,
              color: AppColors.textTertiary,
            ),
            onPressed: onNextMonth,
          ),
        ],
      ),
    );
  }
}
