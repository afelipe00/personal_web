import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/interface/screens/screens.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: AppRoutes.initial,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.initial,
      pageBuilder: (context, state) => const MaterialPage(
        child: WelcomeScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.simpleMode,
      pageBuilder: (context, state) => const MaterialPage(child: HomeSimpleScreen(sections: [])),
    )
  ],
);
