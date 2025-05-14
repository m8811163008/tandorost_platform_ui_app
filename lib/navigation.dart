import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:food_input_app/food_input.dart';

class Navigation {
  static GoRouter goRouter(BuildContext context) {
    return GoRouter(
      initialLocation: '/${SearchRoute.name}',
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return FoodInputShell(body: child);
          },
          routes: [
            GoRoute(
              path: '/${SearchRoute.name}',
              builder: (context, state) {
                return SearchRoute();
              },
              routes: [
                GoRoute(
                  path: '/${SearchRoute.name}/${ResultRoute.name}',
                  builder: (_, state) {
                    return const ResultRoute();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class FoodInputShell extends StatelessWidget {
  const FoodInputShell({super.key, required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: body);
  }
}

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.bottomAppBar,
    this.drawer,
    this.fab,
  }) : assert(
         (bottomNavigationBar == null) || (bottomAppBar == null),
         'Either bottomNavigationBar or bottomAppBar can be set, not both.',
       ),
       assert(
         (bottomNavigationBar == null) || (fab == null),
         'If bottomNavigationBar is set, fab cannot be set.',
       );

  final Widget body;
  final AppBar? appBar;
  final BottomNavigationBar? bottomNavigationBar;
  final BottomAppBar? bottomAppBar;
  final Drawer? drawer;
  final FloatingActionButton? fab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: fab,
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      bottomNavigationBar: bottomNavigationBar ?? bottomAppBar,
      drawer: drawer,
      resizeToAvoidBottomInset: true,
      extendBody: true,
    );
  }
}
