import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/routes/pages/home_page.dart';
import 'package:portfolio/config/routes/router_configuration.dart';
import 'package:portfolio/interface/screens/layout_screen.dart';
import 'package:portfolio/models/home_section.dart';

class PortfolioRouterDelegate extends RouterDelegate<PortfolioRouterConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PortfolioRouterConfiguration> {
  final List<String> sections;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  late Page _homePage;

  // App state fields
  final ValueNotifier<HomeSection?> _sectionNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);

  PortfolioRouterDelegate({required this.sections}) {
    _homePage = HomePage(sections: sections, sectionNotifier: _sectionNotifier);
    Listenable.merge([
      _unknownStateNotifier,
      _sectionNotifier,
    ]).addListener(() {
      notifyListeners();
    });
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  PortfolioRouterConfiguration get currentConfiguration {
    if (_unknownStateNotifier.value == true) {
      return PortfolioRouterConfiguration.unknown();
    } else {
      return PortfolioRouterConfiguration.home(
        path: "/",
        sectionName: _sectionNotifier.value?.name,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorCode = _sectionNotifier.value;
    return Navigator(
      key: navigatorKey,
      pages: _unknownStateNotifier.value == true
          ? [
              const MaterialPage(
                key: ValueKey<String>("Unknown"),
                child: Placeholder(),
              )
            ]
          : [_homePage],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(PortfolioRouterConfiguration configuration) async {
    if (configuration.unknown) {
      _unknownStateNotifier.value = true;
      _sectionNotifier.value = null;
    }
    // else if (configuration.isHomePage) {
    //   _unknownStateNotifier.value = false;
    //   _colorCodeNotifier.value = ColorCode(
    //     hexColorCode: configuration.sectionName ?? defaultColorCode,
    //     source: ColorCodeSelectionSource.fromBrowserAddressBar,
    //   );
    //   _shapeBorderTypeNotifier.value = null;
    // } else if (configuration.isShapePage) {
    //   _unknownStateNotifier.value = false;
    //   _colorCodeNotifier.value = ColorCode(
    //     hexColorCode: configuration.sectionName!,
    //     source: ColorCodeSelectionSource.fromBrowserAddressBar,
    //   );
    //   _shapeBorderTypeNotifier.value = configuration.shapeBorderType;
    // }
  }
}
