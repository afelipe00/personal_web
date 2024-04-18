import 'package:flutter/material.dart';

class ParallaxCard extends StatefulWidget {
  final double width;
  final double height;
  final BoxDecoration? decoration;
  final Widget? child;

  const ParallaxCard({
    super.key,
    required this.height,
    required this.width,
    this.decoration,
    this.child,
  });

  @override
  State<ParallaxCard> createState() => _ParallaxCardState();
}

class _ParallaxCardState extends State<ParallaxCard> {
  double localX = 0.0;
  double localY = 0.0;
  bool defaultPosition = true;
  bool onClick = false;

  @override
  Widget build(BuildContext context) {
    final percentageX = (localX / widget.width) * 100;
    final percentageY = (localY / widget.height) * 100;

    return MouseRegion(
      onEnter: (_) {
        if (!onClick) setState(() => defaultPosition = false);
      },
      onExit: (_) {
        if (!onClick) {
          setState(() {
            localY = widget.height / 2;
            localX = widget.width / 2;
            defaultPosition = true;
          });
        }
      },
      onHover: (details) {
        if (!onClick) {
          if (mounted) setState(() => defaultPosition = false);
          if (details.localPosition.dx > 0 && details.localPosition.dy > 0) {
            if (details.localPosition.dx < widget.width &&
                details.localPosition.dy < widget.height &&
                details.localPosition.dx > 0 &&
                details.localPosition.dy > 0) {
              localX = details.localPosition.dx;
              localY = details.localPosition.dy;
            }
          }
        }
      },
      child: GestureDetector(
        onPanDown: (details) => setState(() {
          defaultPosition = false;
          onClick = true;
        }),
        onPanCancel: () => setState(() {
          defaultPosition = true;
          onClick = false;
        }),
        onPanEnd: (details) => setState(() {
          localY = widget.height / 2;
          localX = widget.width / 2;
          defaultPosition = true;
          onClick = false;
        }),
        onPanUpdate: (details) {
          if (mounted) setState(() => defaultPosition = false);
          if (details.localPosition.dx < widget.width &&
              details.localPosition.dy < widget.height &&
              details.localPosition.dx > 0 &&
              details.localPosition.dy > 0) {
            localX = details.localPosition.dx;
            localY = details.localPosition.dy;
          }
        },
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(defaultPosition ? 0 : (0.3 * (percentageY / 50) + -0.3))
            ..rotateY(defaultPosition ? 0 : (-0.3 * (percentageX / 50) + 0.3)),
          alignment: FractionalOffset.center,
          child: Container(
            height: widget.height,
            width: widget.width,
            decoration: widget.decoration,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
