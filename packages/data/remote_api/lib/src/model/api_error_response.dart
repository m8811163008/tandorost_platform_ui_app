import 'package:json_annotation/json_annotation.dart';

part 'api_error_response.g.dart';

@JsonSerializable(createToJson: false)
class ApiErrorResponse {
  final String? message;
  final String error_detail;

  ApiErrorResponse({required this.message, required this.error_detail});

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);
}
