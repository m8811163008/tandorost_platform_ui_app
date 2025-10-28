import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
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
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    updatedFood = widget.food;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.small);

    return BlocListener<ResultCubit, ResultState>(
      listenWhen: (previous, current) =>
          previous.updatingStatus != current.updatingStatus,
      listener: (context, state) {
        if (state.updatingStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingStatus.isSuccess) {
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
          submitButton: EditFoodDialogSubmitButton(
            updatedFood: updatedFood,
            validate: () => _formKey.currentState!.validate(),
          ),
        ),
      ),
    );
  }
}

class EditFoodDialogSubmitButton extends StatelessWidget {
  const EditFoodDialogSubmitButton({
    super.key,
    required this.updatedFood,
    required this.validate,
  });
  final ValueGetter<bool> validate;
  final Food updatedFood;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultCubit, ResultState>(
      buildWhen: (previous, current) =>
          previous.updatingStatus != current.updatingStatus,
      builder: (context, state) {
        return state.updatingStatus.isLoading
            ? AppTextButton.loading(label: context.l10n.update)
            : AppTextButton(
                label: context.l10n.update,
                onTap: () {
                  if (validate()) {
                    context.read<ResultCubit>().updateFood(updatedFood);
                  }
                },
              );
      },
    );
  }
}
