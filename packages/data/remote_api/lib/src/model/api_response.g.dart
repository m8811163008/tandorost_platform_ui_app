// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ApiResponse', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['message', 'error_detail', 'status', 'data'],
      );
      final val = ApiResponse(
        message: $checkedConvert('message', (v) => v as String?),
        error_detail: $checkedConvert('error_detail', (v) => v as String?),
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$ResponseStatusEnumMap, v),
        ),
        data: $checkedConvert('data', (v) => v),
      );
      return val;
    });

const _$ResponseStatusEnumMap = {
  ResponseStatus.success: 'success',
  ResponseStatus.error: 'error',
};
