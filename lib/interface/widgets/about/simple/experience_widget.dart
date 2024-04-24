import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/app_dimensions.dart';
import 'package:portfolio/models/experience.dart';
import 'package:timelines/timelines.dart';

final experiences = [
  Experience(
    title: 'Konyu - Tech Lead',
    body:
        "Lead a development team for Konyu in charge of creating the first completely autonomous marketplace in Colombia, through the development of a mobile application, an administrative web portal and computer vision algorithms in an IoT system. ",
    checkIn: DateTime(2022),
  ),
  Experience(
    title: 'Nextonia - Software Developer',
    body:
        "Manage services created in the cloud, accounts in digital stores and tools for development; Supervise and develop a web application, a mobile app and IoT platform based on microservices and serverless architecture, design the database models and architecture with high scalability and response speed in mind.",
    checkIn: DateTime(2021),
    checkOut: DateTime(2022),
  ),
  Experience(
    title: 'Nextonia - College Intern',
    body:
        "Learn and develop web applications based on microservices and serverless architecture, create API's with python (AZ Functions), Django and flask framework, perform testing, CI and CD.",
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
    double contentWidth = size.width * 0.4;
    double nodePosition = 0.04;
    if (size.width > AppDimensions.wideLayoutXl) {
      contentWidth = size.width * 0.4;
      nodePosition = 0.04;
    } else if (size.width > AppDimensions.wideLayout2L) {
      contentWidth = size.width * 0.5;
      nodePosition = 0.03;
    } else if (size.width > AppDimensions.wideLayoutL) {
      contentWidth = size.width * 0.7;
      nodePosition = 0.03;
    } else {
      contentWidth = size.width * 0.9;
      nodePosition = 0.0;
    }
    return Timeline.tileBuilder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      theme: TimelineThemeData(
        nodePosition: nodePosition,
        indicatorTheme: const IndicatorThemeData(
          size: 14.0,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        itemCount: experiences.length,
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
        contentsBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: contentWidth,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.03),
                    Colors.white.withOpacity(0.03),
                  ],
                ),
              ),
              child: ContentTimeLineWidget(contentWidth: contentWidth, index: index),
            ),
          );
        },
      ),
    );
  }
}

class ContentTimeLineWidget extends StatelessWidget {
  const ContentTimeLineWidget({
    super.key,
    required this.contentWidth,
    required this.index,
  });

  final double contentWidth;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final rowContent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: contentWidth * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                experiences[index].title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontFamily: GoogleFonts.workSans().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                experiences[index].body,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
        experiences[index].isCurrent
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.green.withOpacity(0.5),
                  ),
                ),
                child: Text(
                  'present',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: GoogleFonts.workSans().fontFamily,
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
              )
            : Text(
                '${experiences[index].checkIn.year} - ${experiences[index].checkOut?.year}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                ),
              ),
      ],
    );

    final columnContent = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          experiences[index].title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: GoogleFonts.workSans().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (experiences[index].isCurrent)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Transform.scale(
              scale: 0.9,
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.green.withOpacity(0.5),
                  ),
                ),
                child: Text(
                  'present',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: GoogleFonts.workSans().fontFamily,
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          )
        else
          Text(
            '${experiences[index].checkIn.year} - ${experiences[index].checkOut?.year}',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14.0,
              fontFamily: GoogleFonts.openSans().fontFamily,
            ),
          ),
        const SizedBox(
          height: 12.0,
        ),
        Text(
          experiences[index].body,
          style: TextStyle(
            color: Colors.grey,
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontSize: 12.0,
          ),
        ),
      ],
    );

    return size.width > AppDimensions.wideLayout2M ? rowContent : columnContent;
  }
}
