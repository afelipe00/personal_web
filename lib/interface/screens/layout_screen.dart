import 'package:flutter/material.dart';
import 'package:portfolio/interface/screens/sections.dart';
import 'package:portfolio/interface/widgets/top_navigation_menu.dart';
import 'package:portfolio/models/home_section.dart';

class LayoutScreen extends StatelessWidget {
  final List<String> sections;
  final ValueNotifier<HomeSection?> sectionNotifier;

  const LayoutScreen({
    super.key,
    required this.sections,
    required this.sectionNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          // TopNavigationMenu(
          //   colors: sections,
          //   colorCodeNotifier: sectionNotifier,
          // ),
          Expanded(
            child: HomeSections(
              key: ValueKey(MediaQuery.of(context).size.height), // needed for resizing window
              sections: sections,
              sectionNotifier: sectionNotifier,
            ),
          ),
        ],
      ),
    );
  }
}
