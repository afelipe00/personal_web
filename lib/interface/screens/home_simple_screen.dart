import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/interface/widgets/home/simple_about.dart';

class HomeSimpleScreen extends StatelessWidget {
  final List<String> sections;

  const HomeSimpleScreen({
    super.key,
    required this.sections,
  });

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
                  'Experience',
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.0),
                HomeMyInfo(),
                SizedBox(height: 20.0),
                SocialButtons(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.grey.withOpacity(0.5),
                    thickness: 0.5,
                  ),
                ),
                SectionsButtons(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 30.0),
                  child: SimpleAbout(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeMyInfo extends StatelessWidget {
  const HomeMyInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(1.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/200/300.jpg"),
            backgroundColor: Colors.indigo,
            radius: 28.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "Hi, I'm Felipe Díaz",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.workSans().fontFamily,
            ),
          ),
        ),
        Text(
          "Electronics Engineer",
          style: TextStyle(
            color: Colors.white60,
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
            fontFamily: GoogleFonts.workSans().fontFamily,
          ),
        ),
      ],
    );
  }
}

class SocialButtons extends StatefulWidget {
  const SocialButtons({super.key});

  @override
  State<SocialButtons> createState() => _SocialButtonsState();
}

class _SocialButtonsState extends State<SocialButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            twitter50Filled,
            scale: 2.0,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            github50Filled,
            scale: 2.0,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            linkedin50Filled,
            scale: 2.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class SectionsButtons extends StatefulWidget {
  const SectionsButtons({super.key});

  @override
  State<SectionsButtons> createState() => _SectionsButtonsState();
}

class _SectionsButtonsState extends State<SectionsButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              )),
          child: Text(
            "About",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontFamily: GoogleFonts.workSans().fontFamily,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Projects",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: GoogleFonts.workSans().fontFamily,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Uses",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: GoogleFonts.workSans().fontFamily,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Blogs",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: GoogleFonts.workSans().fontFamily,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Contact",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: GoogleFonts.workSans().fontFamily,
            ),
          ),
        ),
      ],
    );
  }
}
