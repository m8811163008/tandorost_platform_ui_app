import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_input/food_input.dart';
import 'package:food_input_app/src/result_route/cubit/result_cubit.dart';
import 'package:food_input_app/src/result_route/result_body.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ResultRoute extends StatelessWidget {
  const ResultRoute({
    super.key,
    this.onBottomNavigationChanged,
    required this.bottomNavigationIndex,
  });
  final ValueChanged<int>? onBottomNavigationChanged;
  final int bottomNavigationIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => ResultCubit(
            foodInputRepository: RepositoryProvider.of<FoodInputRepository>(
              context,
            ),
          ),
      child: AppScaffold(
        appBar: AppBar(),

        bottomNavigationBar: BottomNavigationBar(
          onTap: onBottomNavigationChanged,
          currentIndex: bottomNavigationIndex,
          items: AppNavigation.bottomNavigationItems(context),
        ),
        body: BlocProvider(
          create:
              (_) => ResultCubit(
                foodInputRepository: RepositoryProvider.of<FoodInputRepository>(
                  context,
                ),
              ),
          child: const ResultBody(),
        ),
      ),
    );
  }
}
