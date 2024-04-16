import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portfolio/interface/widgets/about/my_info_widget.dart';
import 'package:portfolio/interface/widgets/about/section_buttons_widget.dart';
import 'package:portfolio/interface/widgets/about/social_buttons_widget.dart';
import 'package:portfolio/interface/widgets/home/simple_about.dart';
import 'package:portfolio/interface/widgets/home/simple_blogs.dart';
import 'package:portfolio/interface/widgets/home/simple_contact.dart';
import 'package:portfolio/interface/widgets/home/simple_projects.dart';
import 'package:portfolio/interface/widgets/home/simple_uses.dart';

class HomeSimpleScreen extends StatefulWidget {
  final List<String> sections;

  const HomeSimpleScreen({
    super.key,
    required this.sections,
  });

  @override
  State<HomeSimpleScreen> createState() => _HomeSimpleScreenState();
}

class _HomeSimpleScreenState extends State<HomeSimpleScreen> with SingleTickerProviderStateMixin {
  int _selectedSection = 2;
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Transform.scale(
              scale: 0.8,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(
                    color: Colors.green.withOpacity(0.5),
                  ),
                ),
                child: Text(
                  'Beauty',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: GoogleFonts.workSans().fontFamily,
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: SingleChildScrollView(
          child: Column(
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
                    3 => const SimpleBlog(),
                    4 => const SimpleContact(),
                    _ => Container(),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
