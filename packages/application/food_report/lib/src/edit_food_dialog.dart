import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      listenWhen:
          (previous, current) =>
              previous.updateFoodsNutritionsStatus !=
              current.updateFoodsNutritionsStatus,
      listener: (context, state) {
        if (state.updateFoodsNutritionsStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updateFoodsNutritionsStatus.isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updateFoodsNutritionsStatus.isSuccess) {
          // fetch foods list
          Navigator.of(context).pop();
        }
      },
      child: Form(
        key: _formKey,
        child: AppDialog(
          fullscreen: true,
          title: context.l10n.update,
          contents: [
            _buildDateTextField(),
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
              initalValue: updatedFood.quantityOfUnitOfMeasurement.toString(),
              onChange: (value) {
                updatedFood = updatedFood.copyWith(
                  quantityOfUnitOfMeasurement: int.parse(value),
                );
              },
            ),

            gap,
            NumberTextField(
              label: context.l10n.calculatedCalorie,
              initalValue: updatedFood.calculatedCalorie.toString(),
              onChange: (value) {
                updatedFood = updatedFood.copyWith(
                  calculatedCalorie: int.parse(value),
                );
              },
            ),

            gap,
            NumberTextField(
              label: context.l10n.fat,
              initalValue: updatedFood.macroNutrition.fat.toString(),
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
              initalValue: updatedFood.macroNutrition.protein.toString(),
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
              initalValue: updatedFood.macroNutrition.carbohydrate.toString(),
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
              items:
                  CarbohydrateSourceLD.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            context.l10n.carbohydrateSourceValue(e.name),
                          ),
                        ),
                      )
                      .toList(),
              onChange: (value) {
                if (value != null) {
                  updatedFood = updatedFood.copyWith(carbohydrateSource: value);
                  setState(() {});
                }
              },
            ),
          ],
          submitButton: BlocBuilder<FoodReportCubit, FoodReportState>(
            buildWhen:
                (previous, current) =>
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

  Widget _buildDateTextField() {
    return TextField(
      controller: TextEditingController(
        text: updatedFood.upsertDate.toLocal().toIso8601String(),
      ),
      decoration: InputDecoration(label: Text(context.l10n.upsertDate)),
      readOnly: false,
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          firstDate: updatedFood.upsertDate.subtract(Duration(days: 5)),
          lastDate: updatedFood.upsertDate.add(Duration(days: 5)),
          initialDate: updatedFood.upsertDate,
        );
        final updatedDateTime = pickedDate?.copyWith(
          hour: updatedFood.upsertDate.hour,
          minute: updatedFood.upsertDate.minute,
          second: updatedFood.upsertDate.second,
        );
        updatedFood = updatedFood.copyWith(upsertDate: updatedDateTime);
        setState(() {});
      },
    );
  }
}
