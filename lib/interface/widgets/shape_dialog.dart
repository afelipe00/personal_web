import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions.dart';

class ShapeDialog extends StatelessWidget {
  final String colorCode;

  const ShapeDialog({
    super.key,
    required this.colorCode,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 250,
        color: Colors.white,
        child: Column(
          children: [
            _bar(),
            Expanded(
              child: _button(context),
            ),
          ],
        ),
      ),
    );
  }

  Padding _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: FittedBox(
          child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'open',
        ),
      )),
    );
  }

  AppBar _bar() {
    final color = colorCode.hexToColor();
    return AppBar(
      title: Text(
        '#$colorCode',
      ),
      backgroundColor: color,
    );
  }
}
