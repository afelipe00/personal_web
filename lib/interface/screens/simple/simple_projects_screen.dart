import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants/images.dart';
import 'package:portfolio/interface/widgets/frosted_glass.dart';
import 'package:portfolio/interface/widgets/parallax_card.dart';
import 'package:portfolio/models/app_dimensions.dart';
import 'package:portfolio/models/projects.dart';

final projects = [
  Project(
    name: 'Konyu App Mobile',
    description:
        "Developed Flutter mobile app with market status, purchasing, promotion features. Utilized modern state managers, Firebase services (realtime database, FCM, Crashlytics), APIs, animations, clean architecture.",
    images: [
      projectApp0,
      projectApp1,
      projectApp2,
    ],
  ),
  Project(
    name: 'Konyu Portal Web',
    description:
        "Led development of ReactJS web portal with Tailwind for administrative users. Provided updated market information.",
    images: [
      projectPortal0,
      projectPortal1,
      projectPortal2,
    ],
  ),
  Project(
    name: 'Konyu Smart Market',
    description:
        "I was part of the development team in charge of creating the recognition algorithm for the products taken on the market",
    images: [
      projectSm0,
      projectSm1,
      projectSm2,
    ],
  ),
  Project(
    name: 'AgTech - Agriculture Tech',
    description:
        "Created algorithm for university project detecting agricultural crop diseases using cameras and sensors.",
    images: [
      projectAgTech0,
      projectAgTech1,
    ],
  ),
];

class SimpleProjects extends StatefulWidget {
  const SimpleProjects({super.key});

  @override
  State<SimpleProjects> createState() => _SimpleProjectsState();
}

class _SimpleProjectsState extends State<SimpleProjects> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 20.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: size.width > AppDimensions.wideLayoutL ? 2 : 1,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1.5,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return ParallaxCard(
            height: size.height / 2,
            width: size.width / 2.3,
            child: Card(
              elevation: 10,
              color: const Color(0xFF393939),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Stack(
                children: [
                  Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CarouselSlider.builder(
                        itemCount: projects[index].images.length,
                        itemBuilder: (context, i, realIndex) {
                          if (index == 0) {
                            return Container(
                              color: Colors.black.withOpacity(0.72),
                              child: Image.asset(
                                projects[index].images[i],
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            );
                          } else {
                            return Image.asset(
                              projects[index].images[i],
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          }
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 8),
                          autoPlayAnimationDuration: const Duration(seconds: 3),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          viewportFraction: 1.0,
                          scrollPhysics: const NeverScrollableScrollPhysics(),
                        ),
                      ),
                    ),
                  ),
                  FrostedGlassWidget(
                    child: Container(
                      alignment: AlignmentDirectional.bottomStart,
                      child: ListTile(
                        title: Text(
                          projects[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontSize: 20.0,
                          ),
                        ),
                        subtitle: Text(
                          projects[index].description,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
