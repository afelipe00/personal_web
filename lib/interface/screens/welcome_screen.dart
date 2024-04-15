import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants/routes.dart';
import 'package:portfolio/interface/widgets/gradient_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int indexWord = 0;
  List<String> words = [
    'creative',
    'python',
    'flutter',
    'web',
    'mobile',
    'AI',
  ];

  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      setState(() {
        indexWord = (indexWord + 1) % words.length;
      });
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF111010),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Build with your next',
              style: TextStyle(
                fontFamily: GoogleFonts.archivoBlack().fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 80,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: SizedBox(
                    key: ValueKey<int>(indexWord),
                    width: size.width * 0.3,
                    child: GradientText(
                      text: words[indexWord],
                    ),
                  ),
                ),
                Text(
                  ' developer',
                  style: TextStyle(
                    fontFamily: GoogleFonts.archivoBlack().fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Select your mode',
                style: TextStyle(
                  fontFamily: GoogleFonts.workSans().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => context.push(AppRoutes.simpleMode),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF262626).withOpacity(0.7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Color(0xFF525252),
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: 90,
                    child: Text(
                      'Simplified',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: GoogleFonts.workSans().fontFamily,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                OutlinedButton(
                  onPressed: () => context.push(AppRoutes.experienceMode),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      color: Colors.green.withOpacity(0.5),
                    ),
                  ),
                  child: SizedBox(
                    width: 90,
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
