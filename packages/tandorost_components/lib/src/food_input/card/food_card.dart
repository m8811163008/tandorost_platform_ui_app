import 'package:flutter/material.dart';
import 'package:domain_model/domain_model.dart';
import 'package:tandorost_components/src/utility/build_context_l10n_extension.dart';

class FoodResultCard extends StatelessWidget {
  const FoodResultCard({
    super.key,
    required this.food,
    this.onTapDelete,
    this.onTapEdit,
  });
  final Food food;
  final VoidCallback? onTapEdit;
  final VoidCallback? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRichText(
              context.l10n.foodName,
              food.userNativeLanguageFoodName,
            ),
            Divider(),
            _buildRichText(
              context.l10n.calculatedCalorie,
              food.calculatedCalorie.toString(),
            ),
            _buildRichText(
              context.l10n.unitOfMeasurement,
              food.unitOfMeasurementNativeLanguage,
            ),
            _buildRichText(
              context.l10n.quantityOfUnitOfMeasurement,
              food.quantityOfUnitOfMeasurement.toString(),
            ),
            _buildRichText(
              context.l10n.carbohydrate,
              food.macroNutrition.carbohydrate.toString(),
            ),
            _buildRichText(
              context.l10n.carbohydrateSource,
              context.l10n.carbohydrateSourceValue(
                food.carbohydrateSource.name,
              ),
            ),
            _buildRichText(
              context.l10n.fat,
              food.macroNutrition.fat.toString(),
            ),
            _buildRichText(
              context.l10n.protein,
              food.macroNutrition.protein.toString(),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  IconButton.filledTonal(
                    onPressed: onTapDelete,
                    icon: Icon(Icons.delete),
                  ),
                  SizedBox(width: 8.0),
                  IconButton.filledTonal(
                    onPressed: onTapEdit,
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRichText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [TextSpan(text: '$label : '), TextSpan(text: value)],
        ),
      ),
    );
  }
}
