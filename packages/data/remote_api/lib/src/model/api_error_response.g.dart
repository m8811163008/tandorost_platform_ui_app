// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorResponse _$ApiErrorResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ApiErrorResponse', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['message', 'error_detail']);
      final val = ApiErrorResponse(
        message: $checkedConvert('message', (v) => v as String?),
        error_detail: $checkedConvert('error_detail', (v) => v as String),
      );
      return val;
    });
