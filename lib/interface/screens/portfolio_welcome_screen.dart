import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants/routes.dart';
import 'package:portfolio/interface/widgets/gradient_text.dart';
import 'package:portfolio/models/app_dimensions.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int indexWord = 0;
  Timer? _timer;
  double fontSize = 80;
  double scale = 1.0;
  List<String> words = [
    'creative',
    'python',
    'flutter',
    'web',
    'mobile',
    'AI',
  ];

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

    if (size.width > AppDimensions.wideLayoutXl) {
      fontSize = 80;
      scale = 1.0;
    } else if (size.width > AppDimensions.wideLayout2L) {
      fontSize = 60;
      scale = 1.0;
    } else if (size.width > AppDimensions.wideLayout2M) {
      fontSize = 40;
      scale = 0.7;
    } else {
      fontSize = 26;
      scale = 0.7;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF111010),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width,
                  child: RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                      text: 'Build with your next\n',
                      style: TextStyle(
                        fontFamily: GoogleFonts.archivoBlack().fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: fontSize,
                        color: Colors.white,
                      ),
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 800),
                            switchInCurve: Curves.easeOutCubic,
                            switchOutCurve: Curves.easeOutCubic.flipped,
                            child: SizedBox(
                              key: ValueKey<int>(indexWord),
                              width: fontSize <= 40 ? 200 : 370,
                              child: GradientText(
                                text: words[indexWord],
                                sizeFont: fontSize,
                              ),
                            ),
                          ),
                        ),
                        TextSpan(
                          text: ' developer',
                          style: TextStyle(
                            fontFamily: GoogleFonts.archivoBlack().fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: fontSize,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.scale(
                  scale: scale,
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 180,
                    child: ElevatedButton(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Click to start',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: GoogleFonts.workSans().fontFamily,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(
                            FeatherIcons.arrowRight,
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
