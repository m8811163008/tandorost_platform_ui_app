import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_input/food_input.dart';
import 'package:food_input_app/src/result_route/cubit/result_cubit.dart';
import 'package:food_input_app/src/result_route/result_body.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ResultRoute extends StatelessWidget {
  const ResultRoute({super.key});
  static const String name = 'result-route';

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
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'a'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'a'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'a'),
          ],
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
