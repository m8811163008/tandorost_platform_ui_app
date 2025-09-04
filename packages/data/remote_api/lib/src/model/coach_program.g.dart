// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachProgram _$CoachProgramFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CoachProgram',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'user_id',
            'title',
            'description',
            'duration_weeks',
            'price',
            'currency',
            'features',
          ],
        );
        final val = CoachProgram(
          id: $checkedConvert('id', (v) => v as String?),
          userId: $checkedConvert('user_id', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          durationWeeks: $checkedConvert(
            'duration_weeks',
            (v) => (v as num).toInt(),
          ),
          price: $checkedConvert(
            'price',
            (v) => CoachProgram._priceFromJson((v as num).toDouble()),
          ),
          currency: $checkedConvert(
            'currency',
            (v) => $enumDecode(_$CurrencyEnumMap, v),
          ),
          features: $checkedConvert(
            'features',
            (v) => (v as List<dynamic>)
                .map((e) => $enumDecode(_$ProgramFeatureEnumMap, e))
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'durationWeeks': 'duration_weeks',
      },
    );

Map<String, dynamic> _$CoachProgramToJson(CoachProgram instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'duration_weeks': instance.durationWeeks,
      'price': CoachProgram._priceToJson(instance.price),
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'features': instance.features
          .map((e) => _$ProgramFeatureEnumMap[e]!)
          .toList(),
    };

const _$CurrencyEnumMap = {Currency.irRial: 'ir_rial'};

const _$ProgramFeatureEnumMap = {
  ProgramFeature.phoneSupport: 'phone_support',
  ProgramFeature.personalizedNutritionGuide: 'personalized_nutrition_guide',
  ProgramFeature.personalizedSportSupplementGuide:
      'personalized_sport_supplement_guide',
  ProgramFeature.formingCheckVideoSupport: 'forming_check_video_support',
};
