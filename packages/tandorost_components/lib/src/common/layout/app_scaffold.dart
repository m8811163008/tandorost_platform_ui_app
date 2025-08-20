import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,

    this.drawer,
    this.fab,
  }) : assert(
         (bottomNavigationBar == null) || (fab == null),
         'If bottomNavigationBar is set, fab cannot be set.',
       );

  final Widget body;
  final AppBar? appBar;
  final BottomNavigationBar? bottomNavigationBar;
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
      bottomNavigationBar: RoundedBottomNavigationBar(
        bottomNavigationBar: bottomNavigationBar,
      ),
      drawer: drawer,
      resizeToAvoidBottomInset: true,
    );
  }
}

class RoundedBottomNavigationBar extends StatelessWidget {
  const RoundedBottomNavigationBar({
    super.key,
    required this.bottomNavigationBar,
  });
  final BottomNavigationBar? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(context.sizeExtenstion.medium),
        topRight: Radius.circular(context.sizeExtenstion.medium),
      ),
      child: bottomNavigationBar,
    );
  }
}
