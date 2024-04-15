import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants/images.dart';
import 'package:portfolio/models/service.dart';

final services = [
  Service(
    title: 'Web Development',
    description: 'I develop web applications with the latest technologies',
    icon: const Icon(
      Icons.web,
      color: Colors.white,
    ),
  ),
  Service(
    title: 'Mobile Development',
    description: 'I develop web applications with the latest technologies',
    icon: const Icon(
      Icons.phone_android_rounded,
      color: Colors.white,
    ),
  ),
  Service(
    title: 'AI Development',
    description: 'I develop web applications with the latest technologies',
    icon: Image.asset(
      brain60Filled,
      color: Colors.white,
      height: 24.0,
      width: 24.0,
    ),
  ),
];

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({super.key});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40.0,
        ),
        Text(
          'Services',
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
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 42.0,
                    height: 42.0,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: services[index].icon,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    services[index].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.workSans().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    services[index].description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontFamily: GoogleFonts.openSans().fontFamily,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
