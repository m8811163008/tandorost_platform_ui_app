import 'package:flutter/material.dart';
import 'package:tandorost_components/src/common/bottom_sheet/bottom_sheet_header.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AppBottomSheet extends StatefulWidget {
  const AppBottomSheet({super.key, required this.child, required this.title});
  final Widget child;
  final String title;

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = BottomSheet.createAnimationController(this);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      animationController: _controller,
      showDragHandle: true,
      enableDrag: true,
      onClosing: Navigator.of(context).pop,
      constraints: BoxConstraints.tightFor(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
      ),
      builder:
          (context) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.sizeExtenstion.medium,
            ),
            child: Column(
              children: [BottomSheetHeader(title: widget.title), widget.child],
            ),
          ),
    );
  }
}
