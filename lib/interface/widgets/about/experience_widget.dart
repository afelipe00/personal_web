import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/experience.dart';
import 'package:timelines/timelines.dart';

final experiences = [
  Experience(
    title: 'Konyu - Tech Lead',
    body: "Lead a development team for the Konyu in charge of creating",
    checkIn: DateTime(2020),
  ),
  Experience(
    title: 'Konyu - Tech Lead',
    body: "Lead a development team for the Konyu in charge of creating",
    checkIn: DateTime(2020),
    checkOut: DateTime(2021),
  ),
  Experience(
    title: 'Konyu - Tech Lead',
    body: "Lead a development team for the Konyu in charge of creating",
    checkIn: DateTime(2020),
    checkOut: DateTime(2021),
  ),
  Experience(
    title: 'Konyu - Tech Lead',
    body: "Lead a development team for the Konyu in charge of creating",
    checkIn: DateTime(2020),
    checkOut: DateTime(2021),
  ),
];

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({super.key});

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40.0,
        ),
        Text(
          'Experience',
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
        ExperienceTimeLine(size: size),
      ],
    );
  }
}

class ExperienceTimeLine extends StatelessWidget {
  const ExperienceTimeLine({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      shrinkWrap: true,
      theme: TimelineThemeData(
        nodePosition: 0.2,
        indicatorTheme: const IndicatorThemeData(
          size: 14.0,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        itemCount: 3,
        indicatorBuilder: (context, index) {
          int grayValue = (255 - ((index + 1) / 10 * 255)).round();
          return DotIndicator(
            color: Color.fromARGB(255, grayValue, grayValue, grayValue),
          );
        },
        connectorBuilder: (context, index, type) {
          int initialGrayValue = (255 - ((index + 1) / 10 * 255)).round();
          int finalGrayValue = (255 - ((index + 1) / 40 * 255)).round();

          return SizedBox(
            child: DecoratedLineConnector(
              thickness: 1.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, finalGrayValue, finalGrayValue, finalGrayValue),
                    Color.fromARGB(255, initialGrayValue, initialGrayValue, initialGrayValue),
                  ],
                ),
              ),
            ),
          );
        },
        oppositeContentsBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              experiences[index].title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.workSans().fontFamily,
              ),
            ),
          );
        },
        contentsBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: Container(
                width: size.width * 0.35,
                padding: const EdgeInsets.all(12.0),
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
                child: ListTile(
                    subtitle: Text(
                      experiences[index].body,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                      ),
                    ),
                    trailing: experiences[index].isCurrent
                        ? Transform.scale(
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
                                'present',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: GoogleFonts.workSans().fontFamily,
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          )
                        : null),
              ),
            ),
          );
        },
      ),
    );
  }
}
