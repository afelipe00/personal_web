import 'package:flutter/material.dart';
import 'package:portfolio/models/app_dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktopLayout;
  final Widget? tabletLayout;
  final Widget mobileLayout;
  const ResponsiveLayout({super.key, required this.desktopLayout, this.tabletLayout, required this.mobileLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > AppDimensions.wideLayoutXl) {
          return desktopLayout;
        } else if (constraints.maxWidth > AppDimensions.wideLayoutL &&
            constraints.maxWidth < AppDimensions.wideLayoutXl) {
          return tabletLayout ?? mobileLayout;
        } else {
          return mobileLayout;
        }
      },
    );
  }
}
