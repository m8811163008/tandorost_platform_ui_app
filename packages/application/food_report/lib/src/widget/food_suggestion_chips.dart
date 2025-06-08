import 'package:flutter/material.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:food_report_app/src/widget/food_requerment_dialog.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodSuggestionChips extends StatelessWidget {
  const FoodSuggestionChips({super.key, required this.selectedTab});
  final SelectedTab selectedTab;

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(width: context.sizeExtenstion.small);
    return Row(
      children: [
        //rest
        ActionChip.elevated(
          label: Text(
            context.l10n.foodRequerementDialogGeneralRecommendationTitle,
          ),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return GeneralRequrementDialog();
              },
            );
          },
        ),
        gap,
        //rest
        ActionChip.elevated(
          label: Text(
            context.l10n.foodRequerementDialogHydrationTitle,
          ),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return WaterRequrementDialogRestDay();
              },
            );
          },
        ),
        //rest
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
