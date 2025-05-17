import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        childAspectRatio: 0.7,
      ),
      itemCount: 10,
      padding: EdgeInsets.all(context.sizeExtenstion.medium),
      itemBuilder: (context, index) {
        return List.filled(
          10,
          FoodResultCard(
            onTapEdit: () {
              showDialog(
                context: context,

                builder: (context) {
                  return EditFoodDialog(food: _food);
                },
              );
            },
            onTapDelete: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DeleteFoodDialog(food: _food);
                },
              );
            },
            food: _food,
          ),
        )[index];
      },
    );
  }

  Food get _food => Food(
    id: 'id',
    userId: 'userId',
    upsertDate: DateTime.now(),
    userLanguage: Language.arabic,
    userNativeLanguageFoodName: 'userNativeLanguageFoodName',
    translatedToEnglishFoodName: 'translatedToEnglishFoodName',
    unitOfMeasurementNativeLanguage: 'unitOfMeasurementNativeLanguage',
    translatedToEnglishUnitOfMeasurement:
        'translatedToEnglishUnitOfMeasurement',
    calculatedCalorie: 200,
    quantityOfUnitOfMeasurement: 2,
    carbohydrateSource: CarbohydrateSourceLD.fruitsOrNonStarchyVegetables,
    macroNutrition: MacroNutrition(fat: 44, carbohydrate: 20, protein: 25),
  );
}
