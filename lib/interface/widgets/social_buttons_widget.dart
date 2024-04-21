import 'dart:math';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants/images.dart';

class SocialButtons extends StatefulWidget {
  const SocialButtons({super.key});

  @override
  State<SocialButtons> createState() => _SocialButtonsState();
}

class _SocialButtonsState extends State<SocialButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SocialButton(
          imagePath: twitter50Filled,
          hoverImagePath: twitter50Outlined,
          onTap: () {
            js.context.callMethod('open', ['https://twitter.com/a_felipe00']);
          },
          tooltip: "Twitter",
        ),
        SocialButton(
          imagePath: gitHub50Filled,
          hoverImagePath: gitHub50Outlined,
          onTap: () {
            js.context.callMethod('open', ['https://github.com/afelipe00']);
          },
          tooltip: "GitHub",
        ),
        SocialButton(
          imagePath: linkedIn50Filled,
          hoverImagePath: linkedIn50Outlined,
          onTap: () {
            js.context.callMethod(
                'open', ['https://www.linkedin.com/in/andr%C3%A9s-felipe-d%C3%ADaz-rodr%C3%ADguez-835780123/']);
          },
          tooltip: "LinkedIn",
        ),
      ],
    );
  }
}

class SocialButton extends StatefulWidget {
  final String imagePath;
  final String hoverImagePath;
  final void Function()? onTap;
  final String tooltip;

  const SocialButton({
    super.key,
    required this.imagePath,
    required this.hoverImagePath,
    required this.onTap,
    required this.tooltip,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AnimatedOpacity(
            opacity: isHover ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 250),
            curve: Curves.bounceInOut,
            child: AnimatedAlign(
              alignment: isHover ? const Alignment(0.0, -1.0) : Alignment.center,
              duration: const Duration(milliseconds: 250),
              curve: Curves.bounceInOut,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 20.0,
                    child: Transform.rotate(
                      angle: pi / 4,
                      child: Container(
                        height: 10.0,
                        width: 10.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 25.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        widget.tooltip,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.workSans().fontFamily,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                isHover = value;
              });
            },
            onLongPress: () async {
              setState(() {
                isHover = true;
              });
              await Future.delayed(const Duration(milliseconds: 500));
              setState(() {
                isHover = false;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: widget.onTap,
            child: Image.asset(
              isHover ? widget.hoverImagePath : widget.imagePath,
              scale: 2.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
