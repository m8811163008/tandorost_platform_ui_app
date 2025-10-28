import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class EditFoodDialog extends StatefulWidget {
  const EditFoodDialog({super.key, required this.food});
  final Food food;

  @override
  State<EditFoodDialog> createState() => _EditFoodDialogState();
}

class _EditFoodDialogState extends State<EditFoodDialog> {
  late Food updatedFood;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    updatedFood = widget.food;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.small);

    return BlocListener<FoodReportCubit, FoodReportState>(
      listenWhen: (previous, current) =>
          previous.updateFoodsNutritionsStatus !=
          current.updateFoodsNutritionsStatus,
      listener: (context, state) {
        if (state.updateFoodsNutritionsStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updateFoodsNutritionsStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updateFoodsNutritionsStatus.isSuccess) {
          final cubit = context.read<FoodReportCubit>();
          cubit.resetSelectedFoods();
          cubit.readFoodsNutrition();
          cubit.readNutritionRequirements();
          Navigator.of(context).pop();
        }
      },
      child: Form(
        key: _formKey,
        child: AppDialog(
          title: context.l10n.update,
          contents: [
            DateTextField(
              upsertDate: updatedFood.upsertDate,
              onPickedDate: (updatedDateTime) {
                updatedFood = updatedFood.copyWith(upsertDate: updatedDateTime);
                setState(() {});
              },
            ),
            gap,
            RegullarTextField(
              label: context.l10n.foodName,
              initalValue: updatedFood.userNativeLanguageFoodName,
              onChange: (value) {
                updatedFood = updatedFood.copyWith(
                  userNativeLanguageFoodName: value,
                );
              },
            ),

            gap,
            RegullarTextField(
              label: context.l10n.unitOfMeasurement,
              initalValue: updatedFood.unitOfMeasurementNativeLanguage,
              onChange: (value) {
                updatedFood = updatedFood.copyWith(
                  unitOfMeasurementNativeLanguage: value,
                );
              },
            ),

            gap,
            NumberTextField(
              label: context.l10n.quantityOfUnitOfMeasurement,
              initialValue: updatedFood.quantityOfUnitOfMeasurement.toString(),
              onChange: (value) {
                updatedFood = updatedFood.copyWith(
                  quantityOfUnitOfMeasurement: int.parse(value),
                );
              },
            ),

            gap,
            NumberTextField(
              label: context.l10n.calculatedCalorie,
              initialValue: updatedFood.calculatedCalorie.toString(),
              onChange: (value) {
                updatedFood = updatedFood.copyWith(
                  calculatedCalorie: int.parse(value),
                );
              },
            ),

            gap,
            NumberTextField(
              label: context.l10n.fat,
              initialValue: updatedFood.macroNutrition.fat.toString(),
              onChange: (value) {
                updatedFood = updatedFood.copyWith(
                  macroNutrition: updatedFood.macroNutrition.copyWith(
                    fat: int.parse(value),
                  ),
                );
              },
            ),

            gap,
            NumberTextField(
              label: context.l10n.protein,
              initialValue: updatedFood.macroNutrition.protein.toString(),
              onChange: (value) {
                updatedFood = updatedFood.copyWith(
                  macroNutrition: updatedFood.macroNutrition.copyWith(
                    protein: int.parse(value),
                  ),
                );
              },
            ),

            gap,
            NumberTextField(
              label: context.l10n.carbohydrate,
              initialValue: updatedFood.macroNutrition.carbohydrate.toString(),
              onChange: (value) {
                updatedFood = updatedFood.copyWith(
                  macroNutrition: updatedFood.macroNutrition.copyWith(
                    carbohydrate: int.parse(value),
                  ),
                );
              },
            ),
            gap,
            DropDownField<CarbohydrateSourceLD>(
              label: context.l10n.carbohydrateSource,
              value: updatedFood.carbohydrateSource,
              items: CarbohydrateSourceLD.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(context.l10n.carbohydrateSourceValue(e.name)),
                    ),
                  )
                  .toList(),
              onChange: (value) {
                if (value != null) {
                  updatedFood = updatedFood.copyWith(carbohydrateSource: value);
                  setState(() {});
                }
              },
              errorText: null,
            ),
          ],
          submitButton: BlocBuilder<FoodReportCubit, FoodReportState>(
            buildWhen: (previous, current) =>
                previous.updateFoodsNutritionsStatus !=
                current.updateFoodsNutritionsStatus,
            builder: (context, state) {
              return state.updateFoodsNutritionsStatus.isLoading
                  ? AppTextButton.loading(label: context.l10n.update)
                  : AppTextButton(
                      label: context.l10n.update,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<FoodReportCubit>().updateFoodsNutritions(
                            updatedFood,
                          );
                        }
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
