import 'package:cook_secret/screens/main_navigator/main_navigator_screen.dart';
import 'package:cook_secret/screens/passing_screen/passing_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: PassingScreen.routeUrl,
      routes: [
        GoRoute(
          name: PassingScreen.routeName,
          path: PassingScreen.routeUrl,
          pageBuilder: (context, state) =>
              const CupertinoPage(child: PassingScreen()),
        ),
        GoRoute(
          path: "/:tab(recipe|homepage|bookmark)",
          name: MainNavigation.routeName,
          pageBuilder: (context, state) {
            final tab = state.pathParameters["tab"]!;
            return CupertinoPage(child: MainNavigation(tab: tab));
          },
        ),
      ],
    );
  },
);
