import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_input_app/src/result_route/cubit/result_cubit.dart';
import 'package:food_input_app/src/result_route/delete_food_dialog.dart';
import 'package:food_input_app/src/result_route/edit_food_dialog.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ResultBody extends StatelessWidget {
  const ResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final count =
        width >= 768
            ? width > 1024
                ? 4
                : 3
            : 2;
    return BlocBuilder<ResultCubit, ResultState>(
      buildWhen: (previous, current) => previous.foods != current.foods,
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count,
            childAspectRatio: 0.7,
          ),
          itemCount: state.foods.length,
          padding: EdgeInsets.all(context.sizeExtenstion.medium),
          itemBuilder: (context, index) {
            final food = state.foods[index];
            return FoodResultCard(
              onTapEdit: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return EditFoodDialog(food: food);
                  },
                );
              },
              onTapDelete: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteFoodDialog(food: food);
                  },
                );
              },
              food: food,
            );
          },
        );
      },
    );
  }
}
