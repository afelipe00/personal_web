import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientText extends StatefulWidget {
  final String text;
  final double sizeFont;
  final String? fontFamily;
  final List<Color>? colors;

  const GradientText({
    super.key,
    required this.text,
    required this.sizeFont,
    this.fontFamily,
    this.colors,
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
        colors: widget.colors ??
            const [
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
        textAlign: TextAlign.right,
        style: TextStyle(
          fontFamily: widget.fontFamily ?? GoogleFonts.archivoBlack().fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: widget.sizeFont,
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
