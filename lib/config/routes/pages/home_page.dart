import 'package:flutter/material.dart';
import 'package:portfolio/interface/screens/home_screen.dart';
import 'package:portfolio/interface/screens/layout_screen.dart';
import 'package:portfolio/models/home_section.dart';

class HomePage<T> extends Page<T> {
  final List<String> sections;
  final ValueNotifier<HomeSection?> sectionNotifier;

  HomePage({
    required this.sections,
    required this.sectionNotifier,
  }) : super(key: ValueKey(sections));

  @override
  Route<T> createRoute(BuildContext context) {
    return MaterialPageRoute<T>(
      settings: this,
      builder: (BuildContext context) {
        return HomeScreen(
          sections: sections,
          sectionNotifier: sectionNotifier,
        );
      },
    );
  }
}
