import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants/images.dart';
import 'package:portfolio/models/app_dimensions.dart';
import 'package:portfolio/models/languages.dart';

final languages = [
  Language(
    name: 'Python',
    image: pythonLogo,
    color: const Color(0xFFF9D739),
  ),
  Language(
    name: 'Rust',
    image: rustLogo,
    color: Colors.grey,
  ),
  Language(
    name: 'Dart',
    image: dartLogo,
    color: const Color(0xFF5FCFB9),
  ),
  Language(
    name: 'TypeScript',
    image: typescriptLogo,
    color: Colors.blueAccent,
  ),
  Language(
    name: 'FastAPI',
    image: fastAPILogo,
    color: const Color(0xFF44978B),
  ),
  Language(
    name: 'Flutter',
    image: flutterLogo,
    color: Colors.blue,
  ),
  Language(
    name: 'Astro',
    image: astroLogo,
    color: const Color(0xFFD84DD3),
  ),
  Language(
    name: 'React',
    image: reactLogo,
    color: const Color(0xFF82D8F7),
  ),
];

class SimpleUses extends StatefulWidget {
  const SimpleUses({super.key});

  @override
  State<SimpleUses> createState() => _SimpleUsesState();
}

class _SimpleUsesState extends State<SimpleUses> {
  Color colorWord = Colors.green;
  String currentWord = 'project';
  int currentIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 40.0,
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: size.width > AppDimensions.wideLayoutL
                ? 3
                : size.width > AppDimensions.wideLayoutM
                    ? 2
                    : 1,
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
                      WidgetSpan(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          switchInCurve: Curves.easeInOutBack,
                          switchOutCurve: Curves.easeInOutBack.flipped,
                          child: Text(
                            key: ValueKey(UniqueKey()),
                            currentWord,
                            style: TextStyle(
                              fontFamily: GoogleFonts.archivoBlack().fontFamily,
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: colorWord,
                            ),
                          ),
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
              return GestureDetector(
                onTap: () async {
                  setState(() {
                    colorWord = languages[index - 1].color;
                    currentWord = languages[index - 1].name;
                    currentIndex = index - 1;
                  });
                  await Future.delayed(const Duration(milliseconds: 500));
                  setState(() {
                    colorWord = Colors.green;
                    currentWord = 'project';
                    currentIndex = -1;
                  });
                },
                child: MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      colorWord = languages[index - 1].color;
                      currentWord = languages[index - 1].name;
                      currentIndex = index - 1;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      colorWord = Colors.green;
                      currentWord = 'project';
                      currentIndex = -1;
                    });
                  },
                  child: Container(
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
                      boxShadow: currentIndex == index - 1
                          ? [
                              BoxShadow(
                                color: languages[index - 1].color.withOpacity(0.1),
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                              ),
                            ]
                          : [],
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
                  ),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
