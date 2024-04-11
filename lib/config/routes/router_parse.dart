import 'package:flutter/material.dart';
import 'package:portfolio/config/routes/router_configuration.dart';

class PortfolioRouteParser extends RouteInformationParser<PortfolioRouterConfiguration> {
  final List<String> sections;

  PortfolioRouteParser({required this.sections});

  @override
  Future<PortfolioRouterConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.uri.path);
    if (uri.pathSegments.isEmpty) {
      return PortfolioRouterConfiguration.initial();
    } else if (uri.pathSegments.length == 2) {
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      if (first == 'colors' && _isValidColor(second)) {
        return PortfolioRouterConfiguration.home(path: "/men", sectionName: second);
      } else {
        return PortfolioRouterConfiguration.unknown();
      }
    } else if (uri.pathSegments.length == 3) {
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      if (first == 'colors') {
        return PortfolioRouterConfiguration.home(
          path: "/men2",
          sectionName: second,
        );
      } else {
        return PortfolioRouterConfiguration.unknown();
      }
    } else {
      return PortfolioRouterConfiguration.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(PortfolioRouterConfiguration configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(location: '/unknown');
    }
    // else if (configuration.isHomePage) {
    //   return RouteInformation(
    //     location: configuration.sectionName == null ? '/' : '/colors/${configuration.sectionName}',
    //   );
    // } else if (configuration.isShapePage) {
    //   final borderType = configuration.shapeBorderType?.stringRepresentation();
    //   final location = '/colors/${configuration.sectionName}/$borderType';
    //   return RouteInformation(location: location);
    else {
      return RouteInformation(
        uri: Uri(path: configuration.path),
      );
    }
  }

  bool _isValidColor(String colorCode) {
    final List<String> colorCodes = sections.map((e) {
      return e;
    }).toList();
    return colorCodes.contains("$colorCode");
  }
}
