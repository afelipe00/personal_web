import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:portfolio/config/constants/routes.dart';
import 'package:portfolio/config/routes/router_delegate.dart';
import 'package:portfolio/config/routes/router_parse.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PortfolioRouterDelegate delegate;
  late PortfolioRouteParser parser;

  @override
  void initState() {
    super.initState();
    delegate = PortfolioRouterDelegate(sections: AppRoutes.routes);
    parser = PortfolioRouteParser(sections: AppRoutes.routes);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: delegate,
      routeInformationParser: parser,
    );
  }
}
