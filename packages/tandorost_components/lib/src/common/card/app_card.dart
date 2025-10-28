import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, this.child, this.expanded = false, this.color});
  final Widget? child;
  final bool expanded;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final card = Card(
      color: color,
      child: Padding(
        padding: EdgeInsets.all(context.sizeExtenstion.small),
        child: child,
      ),
    );
    return expanded
        ? SizedBox(width: MediaQuery.of(context).size.width, child: card)
        : card;
  }
}
