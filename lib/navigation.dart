import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_input_app/food_input.dart';

class Navigation {
  static GoRouter goRouter(BuildContext context) {
    return GoRouter(
      initialLocation: '/${SearchRoute.name}',
      routes: [
        GoRoute(
          path: '/${SearchRoute.name}',
          builder: (context, state) {
            return SearchRoute();
          },
          routes: [
            GoRoute(
              path: '/${ResultRoute.name}',
              builder: (_, state) {
                return const ResultRoute();
              },
            ),
          ],
        ),
      ],
    );
  }
}

