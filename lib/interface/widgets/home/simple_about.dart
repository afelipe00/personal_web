import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/interface/widgets/about/experience_widget.dart';
import 'package:portfolio/interface/widgets/about/service_widget.dart';

class SimpleAbout extends StatefulWidget {
  const SimpleAbout({super.key});

  @override
  State<SimpleAbout> createState() => _SimpleAboutState();
}

class _SimpleAboutState extends State<SimpleAbout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Hi! I am an electronic engineer and I had the privilege of being part of a small group of professionals who collaborated in the creation of the first completely autonomous market in Colombia.',
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.openSans().fontFamily,
            ),
          ),
        ),
        const ExperienceWidget(),
        const ServiceWidget()
      ],
    );
  }
}
