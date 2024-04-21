import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:portfolio/interface/screens/in_work_screen.dart';

import 'package:portfolio/interface/widgets/home/simple/my_info_widget.dart';
import 'package:portfolio/interface/widgets/home/simple/section_buttons_widget.dart';
import 'package:portfolio/interface/widgets/social_buttons_widget.dart';
import 'package:portfolio/interface/widgets/footer_widget.dart';
import 'package:portfolio/interface/screens/simple/simple_about_screen.dart';
import 'package:portfolio/interface/screens/simple/simple_contact_screen.dart';
import 'package:portfolio/interface/screens/simple/simple_projects_screen.dart';
import 'package:portfolio/interface/screens/simple/simple_uses_screen.dart';

class SimpleHomeScreen extends StatefulWidget {
  const SimpleHomeScreen({
    super.key,
  });

  @override
  State<SimpleHomeScreen> createState() => _SimpleHomeScreenState();
}

class _SimpleHomeScreenState extends State<SimpleHomeScreen> with SingleTickerProviderStateMixin {
  int _selectedSection = 0;
  late AnimationController controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutQuint,
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.01),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutSine,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onSectionSelected(int index) {
    controller.forward().then((_) {
      setState(() {
        _selectedSection = index;
      });
      controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        leading: const SizedBox.shrink(),
      ),
      body: FooterView(
        flex: 7,
        footer: Footer(
          padding: const EdgeInsets.all(20.0),
          backgroundColor: const Color.fromARGB(255, 44, 44, 44),
          child: const FooterWidget(),
        ),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    height: 160.0,
                    child: const Stack(
                      clipBehavior: Clip.none,
                      children: [
                        MyInfoWidget(),
                        Positioned(
                          bottom: 0.0,
                          left: -10.0,
                          child: SocialButtons(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 0.5,
                    ),
                  ),
                  SectionsButtons(
                    onSectionSelected: _onSectionSelected,
                  ),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: switch (_selectedSection) {
                        0 => const SimpleAbout(),
                        1 => const SimpleProjects(),
                        2 => const SimpleUses(),
                        3 => const InWorkingScreen(),
                        4 => const SimpleContact(),
                        _ => Container(),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
