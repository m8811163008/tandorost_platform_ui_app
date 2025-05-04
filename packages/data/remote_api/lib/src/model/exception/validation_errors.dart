import 'package:json_annotation/json_annotation.dart';
import 'validation_error.dart';

part 'validation_errors.g.dart';

@JsonSerializable()
class ValidationErrors {
  final List<ValidationError>? detail;

  ValidationErrors({this.detail});

  factory ValidationErrors.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorsFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationErrorsToJson(this);
}
