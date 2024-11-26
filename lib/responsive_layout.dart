import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget? desktopLayout;
  final Widget? tabletLayout;

  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    this.desktopLayout,
    this.tabletLayout,
  });

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768; // Mobile
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 768 &&
        MediaQuery.of(context).size.width <= 1200; // Tablet
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200; // Desktop
  }

  static bool isHeightTablet(BuildContext context) {
    return MediaQuery.of(context).size.height <= 768; // Desktop
  }

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
      return mobileLayout;
    }

    if (isTablet(context)) {
      return tabletLayout ?? Container();
    }

    if (isDesktop(context)) {
      if (isHeightTablet(context)) {
        return tabletLayout ?? Container();
      }

      return desktopLayout ?? Container();
    }

    return desktopLayout ?? Container();
  }
}
