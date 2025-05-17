import 'package:flutter/material.dart';

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
  final NavigationDrawer? drawer;
  final FloatingActionButton? fab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: body,
      floatingActionButton: fab,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: bottomNavigationBar ?? bottomAppBar,
      drawer: drawer,
      resizeToAvoidBottomInset: true,
    );
  }
}
