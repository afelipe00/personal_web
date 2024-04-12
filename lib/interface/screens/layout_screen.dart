import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants/routes.dart';

class LayoutScreen extends StatelessWidget {
  final Function(String) onModeTap;

  const LayoutScreen({
    super.key,
    required this.onModeTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(9, 10, 10, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Build with your next',
              style: TextStyle(
                fontFamily: GoogleFonts.archivoBlack().fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 80,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: GradientText(
                  text: 'creative',
                ),
              ),
              Center(
                child: Text(
                  ' developer',
                  style: TextStyle(
                    fontFamily: GoogleFonts.archivoBlack().fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              'Select your mode',
              style: TextStyle(
                fontFamily: GoogleFonts.workSans().fontFamily,
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => onModeTap(AppRoutes.simpleMode),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(95, 53, 65, 68),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: SizedBox(
                    width: size.width * 0.08,
                    child: Text(
                      'Simplified',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: GoogleFonts.workSans().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => onModeTap(AppRoutes.experienceMode),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: SizedBox(
                    width: size.width * 0.08,
                    child: Text(
                      'Experience',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: GoogleFonts.workSans().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class GradientText extends StatefulWidget {
  final String text;

  const GradientText({
    super.key,
    required this.text,
  });

  @override
  State<GradientText> createState() => _GradientTextState();
}

class _GradientTextState extends State<GradientText> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();
    // animation = Tween<double>(begin: 0, end: 1).animate(controller)
    //   ..addListener(() {
    //     setState(() {});
    //   });
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        tileMode: TileMode.mirror,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        // stops: [
        //   animation.value - 0.5,
        //   animation.value - 0.3,
        //   animation.value - 0.1,
        //   animation.value,
        //   animation.value + 0.1,
        //   animation.value + 0.3,
        //   animation.value + 0.5,
        // ],
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.purple,
          Colors.pink,
          Colors.red,
          Colors.orange,
          Colors.yellow,
        ],
        transform: GradientRotation(animation.value * pi * 2),
      ).createShader(bounds),
      child: Text(
        widget.text,
        style: TextStyle(
          fontFamily: GoogleFonts.archivoBlack().fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: 80,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SlideGradient implements GradientTransform {
  final double value;
  final double offset;
  const SlideGradient(this.value, this.offset);

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    final dist = value * (bounds.width + offset);
    return Matrix4.identity()..translate(-dist);
  }
}
