import 'package:json_annotation/json_annotation.dart';

part 'validation_error.g.dart';

/// Represents a validation error with location, message, and type.
@JsonSerializable()
class ValidationError {
  /// The location of the error, can be a list of strings or integers.
  final List<dynamic> loc;

  /// The error message.
  final String msg;

  /// The type of the error.
  final String type;

  ValidationError({required this.loc, required this.msg, required this.type});

  /// Factory constructor for creating a new `ValidationError` instance
  /// from a map (decoded JSON).
  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);

  /// Converts this `ValidationError` instance to a map (for encoding to JSON).
  Map<String, dynamic> toJson() => _$ValidationErrorToJson(this);
}
