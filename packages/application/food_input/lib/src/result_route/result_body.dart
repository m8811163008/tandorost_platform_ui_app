import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        childAspectRatio: 0.8,
      ),
      itemCount: 10,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return List.filled(
          10,
          FoodResultCard(
            food: Food(
              id: 'id',
              userId: 'userId',
              upsertDate: DateTime.now(),
              userLanguage: Language.arabic,
              userNativeLanguageFoodName: 'userNativeLanguageFoodName',
              translatedToEnglishFoodName: 'translatedToEnglishFoodName',
              unitOfMeasurementNativeLanguage:
                  'unitOfMeasurementNativeLanguage',
              translatedToEnglishUnitOfMeasurement:
                  'translatedToEnglishUnitOfMeasurement',
              calculatedCalorie: 200,
              quantityOfUnitOfMeasurement: 2,
              carbohydrateSource:
                  CarbohydrateSourceLD.fruitsOrNonStarchyVegetables,
              macroNutrition: MacroNutrition(
                fat: 44,
                carbohydrate: 20,
                protein: 25,
              ),
            ),
          ),
        )[index];
      },
    );
  }
}
