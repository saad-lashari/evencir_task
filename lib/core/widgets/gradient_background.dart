import 'package:flutter/material.dart';

class AppGradientBackground extends StatelessWidget {
  final Widget child;

  const AppGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0C101B), // deep dark navy
            Color(0xFF0F1E2E), // bluish
            Color(0xFF1A2E3F), // cyan tint
          ],
          stops: [0.0, 0.4, 1.0],
        ),
      ),
      child: child,
    );
  }
}
