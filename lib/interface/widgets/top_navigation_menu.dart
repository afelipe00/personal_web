import 'package:flutter/material.dart';
import 'package:portfolio/models/home_section.dart';
import 'package:portfolio/utils/extensions.dart';

class TopNavigationMenu extends StatelessWidget {
  final List<MaterialColor> colors;
  final ValueNotifier<HomeSection?> colorCodeNotifier;

  const TopNavigationMenu({
    Key? key,
    required this.colors,
    required this.colorCodeNotifier,
  }) : super(key: key);

  int get colorCodeIndex {
    final selectedHexColorCode = colorCodeNotifier.value?.name;
    int index = colors.indexWhere((element) => element.toHex() == selectedHexColorCode);
    return index > -1 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: colorCodeNotifier,
      builder: (BuildContext context, HomeSection? value, Widget? child) {
        return Container(
          color: Colors.black87,
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              for (int i = 0; i < colors.length; i++)
                NavigationMenuButton(
                  color: colors[i],
                  selected: colorCodeIndex == i,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  onPressed: () {
                    colorCodeNotifier.value = HomeSection(
                      name: colors[i].toHex(),
                      source: SelectionSource.fromButtonClick,
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

class NavigationMenuButton extends StatelessWidget {
  final Color color;
  final bool selected;
  final EdgeInsets padding;
  final VoidCallback onPressed;

  const NavigationMenuButton({
    Key? key,
    required this.color,
    required this.selected,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Brightness brightness = ThemeData.estimateBrightnessForColor(color);
    Color textColor = brightness == Brightness.light ? Colors.black : Colors.white;
    return Padding(
      padding: padding,
      child: selected
          ? ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: color),
              child: _text(context, textColor),
            )
          : TextButton(
              onPressed: onPressed,
              child: _text(context, color),
            ),
    );
  }

  Text _text(BuildContext context, Color? textColor) => Text(
        "#${color.toHex()}",
        style: Theme.of(context).textTheme.headline6!.copyWith(color: textColor),
      );
}
