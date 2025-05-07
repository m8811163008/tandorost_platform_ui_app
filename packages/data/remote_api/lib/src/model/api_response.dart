import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(createToJson: false)
class ApiResponse {
  final String? message;
  final String? error_detail;
  final ResponseStatus status;
  final dynamic data;

  ApiResponse({
    required this.message,
    required this.error_detail,
    required this.status,
    required this.data,
  }) : assert(
         status.isError
             ? message != null && error_detail != null
             : message != null || data != null,
       );

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}

enum ResponseStatus {
  success,
  error;

  bool get isError => this == ResponseStatus.error;
  bool get isSuccess => this == ResponseStatus.success;
}
