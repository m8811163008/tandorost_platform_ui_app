import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fitness_data.g.dart';

@JsonSerializable(createToJson: false)
class FitnessData extends Equatable {
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

  @override
  List<Object?> get props => [
    restingMetabolicRate,
    totalDailyEnergyExpenditure,
    bmi,
    bmiPrime,
    bmiLevel,
    waistCircumferenceToHeightRatio,
    isWaistCircumferenceToHeightRatioSafe,
    isWaistCircumferenceSafeRange,
  ];
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
