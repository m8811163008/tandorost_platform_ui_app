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

  CoachProgram.empty()
    : id = null,
      userId = '',
      title = '',
      description = '',
      durationWeeks = 0,
      price = PriceLabel.p1,
      currency = Currency.irRial,
      features = [];

  final String? id;
  final String userId;
  final String title;
  final String description;
  final int durationWeeks;
  @JsonKey(toJson: _priceToJson, fromJson: _priceFromJson)
  final PriceLabel price;
  final Currency currency;
  final List<ProgramFeature> features;

  CoachProgram copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    int? durationWeeks,
    PriceLabel? price,
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

  static double _priceToJson(PriceLabel priceLabel) => priceLabel.price;
  static PriceLabel _priceFromJson(double price) {
    const double epsilon = 0.01;
    return PriceLabel.values.firstWhere(
      (priceLabel) => (priceLabel.price - price).abs() < epsilon,
    );
    // handle StateError
  }

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
}

enum PriceLabel {
  p1(100.0),
  p2(150.0),
  p3(200.0),
  p4(250.0),
  p5(300.0),
  p6(350.0),
  p7(400.0),
  p8(450.0),
  p9(500.0),
  p10(550.0),
  p11(600.0),
  p12(650.0),
  p13(700.0),
  p14(750.0),
  p15(800.0),
  p16(850.0),
  p17(900.0),
  p18(950.0),
  p19(1000.0);

  final double price;

  const PriceLabel(this.price);
}
