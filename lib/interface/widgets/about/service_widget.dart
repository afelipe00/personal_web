import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants/images.dart';
import 'package:portfolio/models/service.dart';

final services = [
  Service(
    title: 'Web Development',
    description:
        'Development with ReactJS and Astro, using TypeScript. Creating dynamic, fast, beautiful interfaces tailored to your needs.',
    icon: const Icon(
      Icons.web,
      color: Colors.white,
    ),
  ),
  Service(
    title: 'Mobile Development',
    description:
        'Development with Flutter to create high-performance mobile applications. Starting from mockups, interface design, prototypes to production deployments.',
    icon: const Icon(
      Icons.phone_android_rounded,
      color: Colors.white,
    ),
  ),
  Service(
    title: 'AI Development',
    description: 'Development with Python and Rust to offer you powerful and secure artificial intelligence solutions.',
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
  int currentIndex = -1;

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
        RichText(
          text: TextSpan(
            text:
                "I'm a developer with experience building ultra-fast, beautiful, highly scalable products with robust code. Ready to take your ideas to the next level! ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontFamily: GoogleFonts.openSans().fontFamily,
            ),
            children: [
              WidgetSpan(
                child: Image.asset(
                  rocket,
                  height: 18.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.8,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            return MouseRegion(
              onEnter: (event) => setState(() {
                currentIndex = index;
              }),
              onExit: (event) => setState(() {
                currentIndex = -1;
              }),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    top: currentIndex == index ? -16.0 : 0.0,
                    curve: Curves.easeInOutBack,
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
                        SizedBox(
                          width: 320.0,
                          child: Text(
                            services[index].description,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                              fontFamily: GoogleFonts.openSans().fontFamily,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
