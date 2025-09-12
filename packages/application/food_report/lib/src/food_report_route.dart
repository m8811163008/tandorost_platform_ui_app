import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_report/food_report.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';

import 'package:food_report_app/src/widget/food_report_screen.dart';
import 'package:profile/profile.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodReportRoute extends StatelessWidget {
  const FoodReportRoute({
    super.key,
    this.goToFoodInputRoute,
    this.goToFitnessProfileRoute,
    this.onBottomNavigationChanged,
    required this.bottomNavigationIndex,
    this.onDrawerNavigationChanged,
    required this.drawerNavigationIndex,
  });

  final VoidCallback? goToFoodInputRoute;
  final VoidCallback? goToFitnessProfileRoute;
  final ValueChanged<int>? onBottomNavigationChanged;
  final int bottomNavigationIndex;
  final ValueChanged<int>? onDrawerNavigationChanged;
  final int drawerNavigationIndex;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FoodReportCubit(
        foodReport: RepositoryProvider.of<FoodReport>(context),
        fitnessNutrition: RepositoryProvider.of<FitnessNutrition>(context),
        profileRepository: RepositoryProvider.of<ProfileRepository>(context),
      ),
      lazy: false,
      child: HomeWidgetListener(
        child: BazzarReviewListener(
          child: FoodReportScreen(
            goToFoodInputRoute: goToFoodInputRoute,
            goToFitnessProfileRoute: goToFitnessProfileRoute,
            bottomNavigationIndex: bottomNavigationIndex,
            drawerNavigationIndex: drawerNavigationIndex,
            onBottomNavigationChanged: onBottomNavigationChanged,
            onDrawerNavigationChanged: onDrawerNavigationChanged,
          ),
        ),
      ),
    );
  }
}

class BazzarReviewListener extends StatelessWidget {
  const BazzarReviewListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodReportCubit, FoodReportState>(
      listenWhen: (previous, current) =>
          previous.foods != current.foods && current.foods.length >= 5,
      listener: (context, state) async {
        // show dialog
        if (state.isCommitReviewedOnCafeBazzar) {
          return;
        }

        await showDialog(
          context: context,
          builder: (ctx) {
            final cubit = context.read<FoodReportCubit>();
            return BlocProvider.value(
              value: cubit,
              child: AppDialog(
                title: context.l10n.reviewDialogTitle,
                contents: [Text(context.l10n.reviewDialogText)],
                submitButton: AppOutLineButton(
                  label: context.l10n.reviewDialogSubmitButtonText,
                  onTap: () async {
                    // Todo add more user friendly review flow with date and skip
                    Navigator.of(ctx).pop();
                    try {
                      await launchBazaarReview('ir.tandorost_a.tandorost');
                      cubit.onCommitedBazzarReview();
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(e.toString())));
                      }
                    }
                  },
                ),
              ),
            );
          },
        );
      },
      child: child,
    );
  }

  Future<void> launchBazaarReview(String packageName) async {
    if (Platform.isAndroid) {
      final intent = AndroidIntent(
        action: 'action_view',
        data: 'bazaar://details?id=$packageName',
        package: 'ir.cafebazaar',
      );
      await intent.launch();
    }
  }
}

class HomeWidgetListener extends StatelessWidget {
  const HomeWidgetListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodReportCubit, FoodReportState>(
      listenWhen: (previous, current) =>
          previous.foods != current.foods &&
          current.foods.length < 5 &&
          current.foods.isNotEmpty,
      listener: (context, state) async {
        // show dialog
        if (state.isShowAddHomeWidgetDialog) {
          return;
        }

        await showDialog(
          context: context,
          builder: (ctx) {
            final cubit = context.read<FoodReportCubit>();
            return BlocProvider.value(
              value: cubit,
              child: AppDialog(
                title: context.l10n.homeWidgetDialogTitle,
                contents: [
                  Text(context.l10n.homeWidgetDialogText),
                  SizedBox(height: context.sizeExtenstion.small),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/gif/add_home_widget_guide.gif',
                      package: 'food_report_app',
                    ),
                  ),
                ],
                submitButton: AppOutLineButton(
                  label: context.l10n.homeWidgetDialogSubmitButtonText,
                  onTap: () async {
                    // Todo add more user friendly review flow with date and skip
                    Navigator.of(ctx).pop();
                    try {
                      await requestAddHomeWidget();
                      cubit.onToggleIsShowAddHomeWidgetDialog();
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(e.toString())));
                      }
                    }
                  },
                ),
              ),
            );
          },
        );
      },
      child: child,
    );
  }

  Future<void> requestAddHomeWidget() async {
    if (Platform.isAndroid) {
      const platform = MethodChannel('ir.tandorost_a.tandorost/widget');
      try {
        await platform.invokeMethod('requestAddHomeWidget');
      } on PlatformException catch (e) {
        // Handle error
        debugPrint('Failed to add widget: $e');
      }
    }
  }
}
