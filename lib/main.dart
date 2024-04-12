import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:portfolio/config/constants/routes.dart';
import 'package:portfolio/interface/screens/screens.dart';

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
  final routes = AppRoutes.routes;
  bool show404 = false;
  String currentMode = AppRoutes.initial;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      home: Navigator(
        pages: [
          const MaterialPage(
            child: SplashScreen(),
          ),
          if (currentMode == AppRoutes.initial)
            MaterialPage(
              key: const ValueKey(AppRoutes.initial),
              child: WelcomeScreen(
                onModeTap: _handlePortfolioMode,
              ),
            ),
          if (currentMode == AppRoutes.simpleMode)
            const MaterialPage(
              key: ValueKey(AppRoutes.simpleMode),
              child: HomeSimpleScreen(
                sections: AppRoutes.sections,
              ),
            ),
          if (currentMode == AppRoutes.experienceMode)
            const MaterialPage(
              key: ValueKey(AppRoutes.experienceMode),
              child: HomeExperienceScreen(),
            ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }

  void _handlePortfolioMode(String mode) {
    setState(() {
      currentMode = mode;
    });
  }
}
