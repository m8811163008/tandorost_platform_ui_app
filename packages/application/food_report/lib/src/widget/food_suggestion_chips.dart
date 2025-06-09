import 'package:flutter/material.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:food_report_app/src/widget/food_requerment_dialog.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodSuggestionChips extends StatelessWidget {
  const FoodSuggestionChips({super.key, required this.selectedTab});
  final SelectedTab selectedTab;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sizeExtenstion.xxExtraLarge,
      child: ListView(
        scrollDirection: Axis.horizontal,

        children: [
          if (selectedTab.isRestDay) ..._buildRestDay(context),
          if (!selectedTab.isRestDay) ..._buildTrainingDay(context),
        ],
      ),
    );
  }

  List<Widget> _buildRestDay(BuildContext context) {
    final gap = SizedBox(width: context.sizeExtenstion.small);
    final age = context.select((FoodReportCubit cubit) {
      return cubit.state.userPhysicalProfile?.age;
    });
    final isTimeRestricted =
        context.select((FoodReportCubit cubit) {
          return cubit.state.userProfile?.isTimeRestrictedEating;
        }) ??
        false;
    return [
      //rest
      //fat
      ActionChip.elevated(
        label: Text(context.l10n.fat),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (_) {
              return FatRequrementDialogRestDay();
            },
          );
        },
      ),
      gap,
      //protein
      ActionChip.elevated(
        label: Text(context.l10n.protein),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (_) {
              return BlocProvider.value(
                value: context.read<FoodReportCubit>(),
                child: ProteinRequrementDialogRestDay(),
              );
            },
          );
        },
      ),
      gap,
      //carbs
      ActionChip.elevated(
        label: Text(context.l10n.carbohydrate),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (_) {
              return BlocProvider.value(
                value: context.read<FoodReportCubit>(),
                child: CarbRequrementDialogRestDay(),
              );
            },
          );
        },
      ),
      //water
      gap,
      ActionChip.elevated(
        label: Text(context.l10n.foodRequerementDialogHydrationTrainingTitle),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (_) {
              return BlocProvider.value(
                value: context.read<FoodReportCubit>(),
                child: WaterRequrementDialogRestDay(),
              );
            },
          );
        },
      ),
      //vitamins and mineral
      gap,
      ActionChip.elevated(
        label: Text(
          context.l10n.foodRequerementDialogGeneralRecommendationTitle,
        ),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (_) {
              return GeneralRequrementDialog();
            },
          );
        },
      ),
      gap,
      if (age != null ? age >= 50 : false) ...[
        ActionChip.elevated(
          label: Text(
            context.l10n.foodRequerementDialogAgeRelatedFoodConsidarationTitle,
          ),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (_) {
                return FoodRequerementDialogAgeRelatedFoodConsidarationRestDay();
              },
            );
          },
        ),
        gap,
      ],
      if (isTimeRestricted)
        ActionChip.elevated(
          label: Text(context.l10n.timeRestrictedEatingLabel),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (_) {
                return TimeRestrictedDialogRestDay();
              },
            );
          },
        ),
    ];
  }

  List<Widget> _buildTrainingDay(BuildContext context) {
    final gap = SizedBox(width: context.sizeExtenstion.small);
    final age = context.select((FoodReportCubit cubit) {
      return cubit.state.userPhysicalProfile?.age;
    });
    return [
      //training
      //carb
      ActionChip.elevated(
        label: Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceTitle,
        ),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (_) {
              return BlocProvider.value(
                value: context.read<FoodReportCubit>(),
                child: CarbRequrementDialogTrainingDayBeforeExcercise(),
              );
            },
          );
        },
      ),
      gap,
      ActionChip.elevated(
        label: Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceTitle,
        ),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (_) {
              return CarbRequrementDialogTrainingDayDuringExcercise();
            },
          );
        },
      ),
      gap,
      ActionChip.elevated(
        label: Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceTitle,
        ),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (_) {
              return BlocProvider.value(
                value: context.read<FoodReportCubit>(),
                child: CarbRequrementDialogTrainingDayAfterExcercise(),
              );
            },
          );
        },
      ),
      //protein
      gap,
      ActionChip.elevated(
        label: Text(context.l10n.protein),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (_) {
              return ProteinRequrementDialogTrainingDay();
            },
          );
        },
      ),
      //water
      gap,
      ActionChip.elevated(
        label: Text(context.l10n.foodRequerementDialogHydrationTrainingTitle),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (_) {
              return BlocProvider.value(
                value: context.read<FoodReportCubit>(),
                child: WaterRequrementDialogTrainingDay(),
              );
            },
          );
        },
      ),
      if (age != null ? age >= 50 : false) ...[
        gap,
        ActionChip.elevated(
          label: Text(
            context.l10n.foodRequerementDialogAgeRelatedFoodConsidarationTitle,
          ),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (_) {
                return FoodRequerementDialogAgeRelatedFoodConsidarationTraningDay();
              },
            );
          },
        ),
      ],
    ];
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
      builder: (_) => FoodInstructionBottomSheetContent(),
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
