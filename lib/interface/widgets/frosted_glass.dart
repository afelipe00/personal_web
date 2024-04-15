import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const FrostedGlassWidget({super.key, this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1.0,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.1),
                  ],
                ),
              ),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
