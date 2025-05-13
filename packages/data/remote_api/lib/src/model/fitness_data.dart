import 'package:json_annotation/json_annotation.dart';

part 'fitness_data.g.dart';

@JsonSerializable(createToJson: false)
class FitnessData {
  final double restingMetabolicRate;
  final double totalDailyEnergyExpenditure;
  final double bmi;
  final double bmiPrime;
  final BmiLevel bmiLevel;
  final double? waistCircumferenceToHeightRatio;
  final bool? isWaistCircumferenceToHeightRatioSafe;
  final bool? isWaistCircumferenceSafeRange;

  FitnessData({
    required this.restingMetabolicRate,
    required this.totalDailyEnergyExpenditure,
    required this.bmi,
    required this.bmiPrime,
    required this.bmiLevel,
    this.waistCircumferenceToHeightRatio,
    this.isWaistCircumferenceToHeightRatioSafe,
    this.isWaistCircumferenceSafeRange,
  });

  factory FitnessData.fromJson(Map<String, dynamic> json) =>
      _$FitnessDataFromJson(json);
}

@JsonEnum(fieldRename: FieldRename.snake)
enum BmiLevel {
  underWeight,
  healthyWeight,
  overWeight,
  obeseClassOne,
  obeseClassTwo,
  obeseClassThree,
}
