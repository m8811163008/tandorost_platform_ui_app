import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Navigation {
  static GoRouter goRouter(BuildContext context) {
    return GoRouter(
      initialLocation: Routes.splash,
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create:
                  (context) => FoodSelectionBloc(
                    RepositoryProvider.of<FoodRepostiory>(context),
                  ),
              // lazy: true,
              child: child,
            );
          },
          routes: [
            GoRoute(
              name: Routes.foodSelection,
              path: Routes.foodSelection,
              builder: (context, state) {
                return const FoodSelectionRoute();
              },
              routes: [
                GoRoute(
                  name: Routes.foodSelectionFoodAmountInput,
                  path: Routes.foodSelectionFoodAmountInput,
                  builder: (_, state) {
                    return const FoodAmountPage();
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          name: Routes.foodSelectionList,
          path: Routes.foodSelectionList,
          builder: (context, state) {
            return const SelectedFoodsListPage();
          },
        ),
        GoRoute(
          name: Routes.foodList,
          path: Routes.foodList,
          builder: (context, state) {
            return const FoodsListRoute();
          },
        ),
        GoRoute(
          name: Routes.strengthTraining,
          path: Routes.strengthTraining,
          builder: (context, state) {
            return StrengthTrainingRoute();
          },
        ),
        GoRoute(
          name: Routes.vo2maxCalculator,
          path: Routes.vo2maxCalculator,
          builder: (context, state) {
            return Vo2maxCalculatorRoute();
          },
        ),
        ShellRoute(
          builder: (context, state, child) {
            return child;
          },
          routes: [
            GoRoute(
              name: Routes.profile,
              path: Routes.profile,
              builder: (context, state) {
                return const ProfileRoute();
              },
              routes: [
                GoRoute(
                  name: Routes.profileActivePremiumWizard,
                  path: Routes.profileActivePremiumWizard,
                  builder: (context, state) {
                    return const ActivePremiumWizardRoute();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
