import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Assuming your extensions/utility imports (like .w, .h, AppColors) are available
// You'll need to replace or define these if they are custom extensions.

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  // Properties equivalent to the original function parameters
  final String icon;
  final String label;
  final int index;

  // New properties to determine the active state and handle the tap
  final int currentIndex;
  final VoidCallback onTap; // Function to be called when the item is tapped

  @override
  Widget build(BuildContext context) {
    // Determine the active state based on the provided index and currentIndex
    final isActive = index == currentIndex;

    // Use placeholder values for custom extensions (.w, .h) and AppColors
    // You should use your actual implementations
    const double w = 1.0; // Placeholder for .w
    const double h = 1.0; // Placeholder for .h
    const Color textSecondary =
        Colors.white; // Placeholder for AppColors.textSecondary

    return TextButton(
      onPressed: onTap, // Use the provided onTap callback
      child: Padding(
        // Replace with your actual responsive values (e.g., 8.0 * w)
        padding: EdgeInsets.symmetric(horizontal: 8 * w, vertical: 8 * h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: 24 * w,
              height: 24 * h,
              colorFilter: ColorFilter.mode(
                isActive
                    ? textSecondary
                    // Assuming AppColors.textSecondary.withValues(alpha: 0.2)
                    // is equivalent to textSecondary.withOpacity(0.2)
                    : textSecondary.withValues(alpha: 0.2),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 4 * h),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 14,
                color: isActive
                    ? textSecondary
                    : textSecondary.withValues(alpha: 0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
