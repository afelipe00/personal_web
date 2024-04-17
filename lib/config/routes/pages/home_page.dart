import 'package:flutter/material.dart';
import 'package:portfolio/interface/screens/simple/home_simple_screen.dart';

class HomePage<T> extends Page<T> {
  final List<String> sections;

  HomePage({
    required this.sections,
  }) : super(key: ValueKey(sections));

  @override
  Route<T> createRoute(BuildContext context) {
    return MaterialPageRoute<T>(
      settings: this,
      builder: (BuildContext context) {
        return HomeSimpleScreen(
          sections: sections,
        );
      },
    );
  }
}
