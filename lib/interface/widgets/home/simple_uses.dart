import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants/images.dart';
import 'package:portfolio/models/languages.dart';

final languages = [
  Language(
    name: 'Python',
    image: pythonLogo,
    color: Colors.blue,
  ),
  Language(
    name: 'Rust',
    image: rustLogo,
    color: Colors.blue,
  ),
  Language(
    name: 'Dart',
    image: dartLogo,
    color: Colors.blue,
  ),
  Language(
    name: 'TypeScript',
    image: typescriptLogo,
    color: Colors.blue,
  ),
  Language(
    name: 'FastAPI',
    image: fastAPILogo,
    color: Colors.blue,
  ),
  Language(
    name: 'Flutter',
    image: flutterLogo,
    color: Colors.blue,
  ),
  Language(
    name: 'Astro',
    image: astroLogo,
    color: Colors.blue,
  ),
  Language(
    name: 'React',
    image: reactLogo,
    color: Colors.blue,
  ),
];

class SimpleUses extends StatefulWidget {
  const SimpleUses({super.key});

  @override
  State<SimpleUses> createState() => _SimpleUsesState();
}

class _SimpleUsesState extends State<SimpleUses> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40.0,
        ),
        Text(
          'Languages',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.workSans().fontFamily,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 3.0,
          ),
          shrinkWrap: true,
          itemCount: languages.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Your ',
                    style: TextStyle(
                      fontFamily: GoogleFonts.archivoBlack().fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'project',
                        style: TextStyle(
                          fontFamily: GoogleFonts.archivoBlack().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.blue,
                        ),
                      ),
                      TextSpan(
                        text: '\nyour way',
                        style: TextStyle(
                          fontFamily: GoogleFonts.archivoBlack().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 0.5,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.05),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        languages[index - 1].image,
                        height: 40.0,
                        width: 40.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        languages[index - 1].name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: GoogleFonts.workSans().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        )
      ],
    );
  }
}
