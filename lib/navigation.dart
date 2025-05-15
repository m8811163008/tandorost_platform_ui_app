import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:food_input_app/food_input.dart';
import 'package:tandorost_components/tandorost_components.dart';

class Navigation {
  static GoRouter goRouter(BuildContext context) {
    return GoRouter(
      initialLocation: '/${SearchRoute.name}',
      routes: [
        GoRoute(
          path: '/${SearchRoute.name}',
          builder: (context, state) {
            return SearchRouteT();
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
    );
  }
}

class SearchRouteT extends StatelessWidget {
  const SearchRouteT({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: SearchBody());
  }
}

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  final ValueKey key = ValueKey('value3');
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton.filledTonal(onPressed: () {}, icon: Icon(Icons.keyboard)),
        AIChatButton(key: key, onLongPressStart: () {}, onLongPressUp: () {}),
      ],
    );
  }
}

class AIChatButton extends StatefulWidget {
  const AIChatButton({super.key, this.onLongPressStart, this.onLongPressUp});
  final VoidCallback? onLongPressStart, onLongPressUp;

  @override
  State<AIChatButton> createState() => _AIChatButtonState();
}

class _AIChatButtonState extends State<AIChatButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse();
      },
      onLongPressStart: (_) {
        _controller.forward();
      },
      onLongPressUp: () {
        _controller.reverse();
      },
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Opacity(opacity: _animation.value, child: child);
            },
            child: LoadingLottie(size: Size.square(120)),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Opacity(opacity: 1 - _animation.value, child: child);
            },
            child: ActiveChatLotties(size: Size.square(120)),
          ),
        ],
      ),
    );
  }
}

class AnimationButtonShape extends StatelessWidget {
  const AnimationButtonShape({super.key, this.isPressed = false, this.child});
  final bool isPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        // color: Colors.transparent,
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: isPressed ? 4 : 8,
        shape: CircleBorder(),
        child: child,
      ),
    );
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
      backgroundColor: Colors.white,
      appBar: appBar,
      body: body,
      floatingActionButton: fab,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: bottomNavigationBar ?? bottomAppBar,
      drawer: drawer,
      resizeToAvoidBottomInset: true,
      extendBody: true,
    );
  }
}
