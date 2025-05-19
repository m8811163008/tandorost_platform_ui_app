import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_input_app/src/result_route/cubit/result_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class EditFoodDialog extends StatefulWidget {
  const EditFoodDialog({super.key, required this.food});
  final Food food;

  @override
  State<EditFoodDialog> createState() => _EditFoodDialogState();
}

class _EditFoodDialogState extends State<EditFoodDialog> {
  late Food updatedFood;
  @override
  void initState() {
    updatedFood = widget.food;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.small);

    return AppDialog(
      fullscreen: true,
      title: context.l10n.update,
      contents: [
        TextField(
          controller: TextEditingController(
            text: widget.food.upsertDate.toLocal().toIso8601String(),
          ),
          decoration: InputDecoration(label: Text(context.l10n.upsertDate)),
          enabled: false,
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              firstDate: widget.food.upsertDate.subtract(Duration(days: 5)),
              lastDate: widget.food.upsertDate.add(Duration(days: 5)),
              initialDate: widget.food.upsertDate,
            );
            updatedFood = widget.food.copyWith(upsertDate: pickedDate);
          },
        ),
        gap,
        TextField(
          controller: TextEditingController(
            text: widget.food.userNativeLanguageFoodName,
          ),
          onChanged: (value) {
            updatedFood = widget.food.copyWith(
              userNativeLanguageFoodName: value,
            );
          },
          onSubmitted: (value) {
            updatedFood = widget.food.copyWith(
              userNativeLanguageFoodName: value,
            );
          },
          decoration: InputDecoration(label: Text(context.l10n.foodName)),
        ),
        gap,
        TextField(
          controller: TextEditingController(
            text: widget.food.unitOfMeasurementNativeLanguage,
          ),
          onChanged: (value) {
            updatedFood = widget.food.copyWith(
              unitOfMeasurementNativeLanguage: value,
            );
          },
          onSubmitted: (value) {
            updatedFood = widget.food.copyWith(
              unitOfMeasurementNativeLanguage: value,
            );
          },
          decoration: InputDecoration(
            label: Text(context.l10n.unitOfMeasurement),
          ),
        ),
        gap,
        TextField(
          controller: TextEditingController(
            text: widget.food.quantityOfUnitOfMeasurement.toString(),
          ),
          onChanged: (value) {
            updatedFood = widget.food.copyWith(
              quantityOfUnitOfMeasurement: int.parse(value),
            );
          },
          onSubmitted: (value) {
            updatedFood = widget.food.copyWith(
              quantityOfUnitOfMeasurement: int.parse(value),
            );
          },
          keyboardType: TextInputType.numberWithOptions(
            signed: false,
            decimal: false,
          ),
          decoration: InputDecoration(
            label: Text(context.l10n.quantityOfUnitOfMeasurement),
          ),
        ),
        gap,
        TextField(
          controller: TextEditingController(
            text: widget.food.calculatedCalorie.toString(),
          ),
          onChanged: (value) {
            updatedFood = widget.food.copyWith(
              calculatedCalorie: int.parse(value),
            );
          },
          onSubmitted: (value) {
            updatedFood = widget.food.copyWith(
              calculatedCalorie: int.parse(value),
            );
          },
          keyboardType: TextInputType.numberWithOptions(
            signed: false,
            decimal: false,
          ),
          decoration: InputDecoration(
            label: Text(context.l10n.calculatedCalorie),
          ),
        ),
        gap,
        TextField(
          controller: TextEditingController(
            text: widget.food.macroNutrition.fat.toString(),
          ),
          onChanged: (value) {
            updatedFood = widget.food.copyWith(
              macroNutrition: widget.food.macroNutrition.copyWith(
                fat: int.parse(value),
              ),
            );
          },
          onSubmitted: (value) {
            updatedFood = widget.food.copyWith(
              macroNutrition: widget.food.macroNutrition.copyWith(
                fat: int.parse(value),
              ),
            );
          },
          keyboardType: TextInputType.numberWithOptions(
            signed: false,
            decimal: false,
          ),
          decoration: InputDecoration(label: Text(context.l10n.fat)),
        ),
        gap,
        TextField(
          controller: TextEditingController(
            text: widget.food.macroNutrition.protein.toString(),
          ),
          onChanged: (value) {
            updatedFood = widget.food.copyWith(
              macroNutrition: widget.food.macroNutrition.copyWith(
                protein: int.parse(value),
              ),
            );
          },
          onSubmitted: (value) {
            updatedFood = widget.food.copyWith(
              macroNutrition: widget.food.macroNutrition.copyWith(
                protein: int.parse(value),
              ),
            );
          },
          keyboardType: TextInputType.numberWithOptions(
            signed: false,
            decimal: false,
          ),
          decoration: InputDecoration(label: Text(context.l10n.protein)),
        ),
        gap,
        TextField(
          decoration: InputDecoration(label: Text(context.l10n.carbohydrate)),
        ),
        gap,
        _buildInputDecorator(context, updatedFood),
      ],
      submitButton: BlocBuilder<ResultCubit, ResultState>(
        buildWhen:
            (previous, current) =>
                previous.updatingStatus != current.updatingStatus,
        builder: (context, state) {
          return state.updatingStatus.isLoading
              ? AppTextButton.loading(label: context.l10n.update)
              : AppTextButton.loading(
                label: context.l10n.update,
                onTap: () {
                  context.read<ResultCubit>().updateFood(updatedFood);
                },
              );
        },
      ),
    );
  }

  InputDecorator _buildInputDecorator(BuildContext context, Food updatedFood) {
    return InputDecorator(
      decoration: InputDecoration(
        label: Text(context.l10n.carbohydrateSource),
        border: const OutlineInputBorder(),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<CarbohydrateSourceLD>(
          isExpanded: true,
          value: widget.food.carbohydrateSource,
          items:
              CarbohydrateSourceLD.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(context.l10n.carbohydrateSourceValue(e.name)),
                    ),
                  )
                  .toList(),
          onChanged: (value) {
            if (value != null) {
              updatedFood = widget.food.copyWith(carbohydrateSource: value);
            }
          },
        ),
      ),
    );
  }
}
