import 'package:flutter/material.dart';
import 'package:food_report_app/src/widget/food_requerment_dialog.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodSuggestionChips extends StatelessWidget {
  const FoodSuggestionChips({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(width: context.sizeExtenstion.small);
    return Row(
      children: [
        ActionChip.elevated(
          label: Text('carbs'),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return FoodRequrementDialog();
              },
            );
          },
        ),
        gap,
        ActionChip.elevated(label: Text('fats'), onPressed: () {}),
      ],
    );
  }
}

class FoodInstructionBottomSheet extends StatefulWidget {
  const FoodInstructionBottomSheet({super.key});

  @override
  State<FoodInstructionBottomSheet> createState() =>
      _FoodInstructionBottomSheetState();
}

class _FoodInstructionBottomSheetState extends State<FoodInstructionBottomSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = BottomSheet.createAnimationController(this);

    super.initState();
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
      builder: (context) => FoodInstructionBottomSheetContent(),
    );
  }
}

class FoodInstructionBottomSheetContent extends StatelessWidget {
  const FoodInstructionBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.sizeExtenstion.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('title', style: context.textTheme.headlineMedium),
          Divider(),
          Placeholder(),
        ],
      ),
    );
  }
}
