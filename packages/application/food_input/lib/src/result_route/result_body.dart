import 'package:flutter/material.dart';
import 'package:food_input_app/src/result_route/cubit/result_cubit.dart';
import 'package:food_input_app/src/result_route/delete_food_dialog.dart';
import 'package:food_input_app/src/result_route/edit_food_dialog.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ResultBody extends StatelessWidget {
  const ResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final count = switch (width) {
      >= 1024 => 4,
      >= 768 => 3,
      > 425 => 1,
      _ => 1,
    };
    final aspectRatio = switch (width) {
      >= 1024 => 1.2,
      >= 768 => 1.0,
      > 425 => 0.7,
      _ => 0.55,
    };
    return BlocConsumer<ResultCubit, ResultState>(
      listenWhen: (previous, current) =>
          previous.foods != current.foods ||
          previous.deletingStatus != current.deletingStatus,
      listener: (context, state) {
        if (state.foods.isEmpty) {
          Navigator.of(context).pop();
        }
      },
      buildWhen: (previous, current) =>
          previous.foods != current.foods ||
          previous.deletingStatus != current.deletingStatus,
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count,
            childAspectRatio: aspectRatio,
          ),
          itemCount: state.foods.length,
          padding: EdgeInsets.all(context.sizeExtenstion.medium),
          itemBuilder: (context, index) {
            final food = state.foods[index];
            return FoodResultCard(
              onTapEdit: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return BlocProvider.value(
                      value: context.read<ResultCubit>(),
                      child: EditFoodDialog(food: food),
                    );
                  },
                );
              },
              onTapDelete: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return BlocProvider.value(
                      value: context.read<ResultCubit>(),
                      child: DeleteFoodDialog(food: food),
                    );
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
