import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:remote_api/remote_api.dart';

part 'coach_program.g.dart';

@JsonSerializable()
class CoachProgram extends Equatable {
  CoachProgram({
    this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.durationWeeks,
    required this.price,
    required this.currency,
    required this.features,
  });
  final String? id;
  final String userId;
  final String title;
  final String description;
  final int durationWeeks;
  final double price;
  final Currency currency;
  final List<ProgramFeature> features;

  CoachProgram copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    int? durationWeeks,
    double? price,
    Currency? currency,
    List<ProgramFeature>? features,
  }) {
    return CoachProgram(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      durationWeeks: durationWeeks ?? this.durationWeeks,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      features: features ?? this.features,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    title,
    description,
    durationWeeks,
    price,
    currency,
    features,
  ];
  Map<String, dynamic> toJson() => _$CoachProgramToJson(this);

  factory CoachProgram.fromJson(Map<String, dynamic> json) =>
      _$CoachProgramFromJson(json);
}

@JsonEnum(fieldRename: FieldRename.snake)
enum ProgramFeature {
  phoneSupport,
  personalizedNutritionGuide,
  personalizedSportSupplementGuide,
  formingCheckVideoSupport,
  achievement,
}
