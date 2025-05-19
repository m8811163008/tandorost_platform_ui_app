import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    return BlocListener<ResultCubit, ResultState>(
      listenWhen:
          (previous, current) =>
              previous.updatingStatus != current.updatingStatus,
      listener: (context, state) {
        if (state.updatingStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingStatus.isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingStatus.isSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: AppDialog(
        fullscreen: true,
        title: context.l10n.update,
        contents: [
          _buildDateTextField(),
          gap,
          UpdateFoodTextField(
            label: context.l10n.foodName,
            initailValue: updatedFood.userNativeLanguageFoodName,
            onUpdate: (value) {
              updatedFood = updatedFood.copyWith(
                userNativeLanguageFoodName: value,
              );
            },
          ),

          gap,
          UpdateFoodTextField(
            label: context.l10n.unitOfMeasurement,
            initailValue: updatedFood.unitOfMeasurementNativeLanguage,
            onUpdate: (value) {
              updatedFood = updatedFood.copyWith(
                unitOfMeasurementNativeLanguage: value,
              );
            },
          ),

          gap,
          UpdateFoodTextField(
            label: context.l10n.quantityOfUnitOfMeasurement,
            initailValue: updatedFood.quantityOfUnitOfMeasurement.toString(),
            onUpdate: (value) {
              updatedFood = updatedFood.copyWith(
                quantityOfUnitOfMeasurement: int.parse(value),
              );
            },
            isDigitField: true,
          ),

          gap,
          UpdateFoodTextField(
            label: context.l10n.calculatedCalorie,
            initailValue: updatedFood.calculatedCalorie.toString(),
            onUpdate: (value) {
              updatedFood = updatedFood.copyWith(
                calculatedCalorie: int.parse(value),
              );
            },
            isDigitField: true,
          ),
          gap,
          UpdateFoodTextField(
            label: context.l10n.fat,
            initailValue: updatedFood.macroNutrition.fat.toString(),
            onUpdate: (value) {
              updatedFood = updatedFood.copyWith(
                macroNutrition: updatedFood.macroNutrition.copyWith(
                  fat: int.parse(value),
                ),
              );
            },
            isDigitField: true,
          ),

          gap,
          UpdateFoodTextField(
            label: context.l10n.protein,
            initailValue: updatedFood.macroNutrition.protein.toString(),
            onUpdate: (value) {
              updatedFood = updatedFood.copyWith(
                macroNutrition: updatedFood.macroNutrition.copyWith(
                  protein: int.parse(value),
                ),
              );
            },
            isDigitField: true,
          ),

          gap,
          UpdateFoodTextField(
            label: context.l10n.carbohydrate,
            initailValue: updatedFood.macroNutrition.carbohydrate.toString(),
            onUpdate: (value) {
              updatedFood = updatedFood.copyWith(
                macroNutrition: updatedFood.macroNutrition.copyWith(
                  carbohydrate: int.parse(value),
                ),
              );
            },
            isDigitField: true,
          ),
          gap,
          _buildDropDown(),
        ],
        submitButton: BlocBuilder<ResultCubit, ResultState>(
          buildWhen:
              (previous, current) =>
                  previous.updatingStatus != current.updatingStatus,
          builder: (context, state) {
            return state.updatingStatus.isLoading
                ? AppTextButton.loading(label: context.l10n.update)
                : AppTextButton(
                  label: context.l10n.update,
                  onTap: () {
                    context.read<ResultCubit>().updateFood(updatedFood);
                  },
                );
          },
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

  InputDecorator _buildDropDown() {
    return InputDecorator(
      decoration: InputDecoration(
        label: Text(context.l10n.carbohydrateSource),
        border: const OutlineInputBorder(),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<CarbohydrateSourceLD>(
          isExpanded: true,
          value: updatedFood.carbohydrateSource,
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
              updatedFood = updatedFood.copyWith(carbohydrateSource: value);
              setState(() {});
            }
          },
        ),
      ),
    );
  }
}

class UpdateFoodTextField extends StatelessWidget {
  const UpdateFoodTextField({
    super.key,
    required this.label,
    this.initailValue,
    this.onUpdate,
    this.isDigitField = false,
  });
  final String label;
  final String? initailValue;
  final ValueSetter<String>? onUpdate;
  final bool isDigitField;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: initailValue),
      onChanged: onUpdate,
      onSubmitted: onUpdate,
      decoration: InputDecoration(label: Text(label)),
      keyboardType:
          isDigitField
              ? TextInputType.numberWithOptions(signed: false, decimal: false)
              : null,
      inputFormatters:
          isDigitField ? [FilteringTextInputFormatter.digitsOnly] : null,
    );
  }
}
