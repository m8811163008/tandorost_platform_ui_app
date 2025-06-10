import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/language_bottom_sheet_form.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet>
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
        height: MediaQuery.of(context).size.height,
      ),
      builder: (context) => LanguageBottomSheetForm(),
    );
  }
}


