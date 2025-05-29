import 'package:flutter/material.dart';
import 'package:domain_model/domain_model.dart';
import 'package:tandorost_components/tandorost_components.dart';

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
    return AppCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRichText(
            context,
            context.l10n.foodName,
            food.userNativeLanguageFoodName,
          ),
          Divider(),
      
          _buildRichText(
            context,
            context.l10n.unitOfMeasurement,
            food.unitOfMeasurementNativeLanguage,
          ),
          _buildRichText(
            context,
            context.l10n.quantityOfUnitOfMeasurement,
            food.quantityOfUnitOfMeasurement.toString(),
          ),
          _buildRichText(
            context,
            context.l10n.calculatedCalorie,
            food.calculatedCalorie.toString(),
          ),
          _buildRichText(
            context,
            context.l10n.fat,
            food.macroNutrition.fat.toString(),
          ),
          _buildRichText(
            context,
            context.l10n.protein,
            food.macroNutrition.protein.toString(),
          ),
          _buildRichText(
            context,
            context.l10n.carbohydrate,
            food.macroNutrition.carbohydrate.toString(),
          ),
          _buildRichText(
            context,
            context.l10n.carbohydrateSource,
            context.l10n.carbohydrateSourceValue(
              food.carbohydrateSource.name,
            ),
          ),
      
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.sizeExtenstion.small,
            ),
            child: Row(
              children: [
                IconButton.filledTonal(
                  onPressed: onTapDelete,
                  icon: Icon(Icons.delete),
                ),
                SizedBox(width: context.sizeExtenstion.small),
                IconButton.filledTonal(
                  onPressed: onTapEdit,
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRichText(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.sizeExtenstion.small),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(text: '$label : ', style: context.textTheme.titleSmall),
            TextSpan(text: value, style: context.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
