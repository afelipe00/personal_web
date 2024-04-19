import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants/images.dart';
import 'package:portfolio/config/constants/routes.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 238, 234),
      body: Stack(
        children: [
          Positioned(
            top: -size.height * 0.2,
            right: -size.width * 0.15,
            child: Container(
              height: 800,
              width: 800,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.3), shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 16,
                  spreadRadius: 8,
                ),
              ]),
            ),
          ),
          Positioned(
            top: -size.height * 0.25,
            right: -size.width * 0.2,
            child: Container(
              height: 800,
              width: 800,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.3), shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 16,
                  spreadRadius: 8,
                ),
              ]),
            ),
          ),
          Positioned(
            top: -size.height * 0.3,
            right: -size.width * 0.25,
            child: Container(
              height: 800,
              width: 800,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.3), shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 16,
                  spreadRadius: 8,
                ),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '404',
                      style: TextStyle(
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontSize: 72,
                        fontWeight: FontWeight.w900,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Image.asset(notFound, width: 46, height: 46)
                  ],
                ),
                Text(
                  'Page not found',
                  style: TextStyle(
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontSize: 56,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.',
                  style: TextStyle(
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => context.go(AppRoutes.initial),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: Text(
                          'Go Home',
                          style: TextStyle(
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
