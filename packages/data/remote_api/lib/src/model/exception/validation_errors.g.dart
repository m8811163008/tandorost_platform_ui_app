// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidationErrors _$ValidationErrorsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ValidationErrors', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['detail']);
      final val = ValidationErrors(
        detail: $checkedConvert(
          'detail',
          (v) =>
              (v as List<dynamic>?)
                  ?.map(
                    (e) => ValidationError.fromJson(e as Map<String, dynamic>),
                  )
                  .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ValidationErrorsToJson(ValidationErrors instance) =>
    <String, dynamic>{
      if (instance.detail?.map((e) => e.toJson()).toList() case final value?)
        'detail': value,
    };
