// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_user_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArchiveUserImagesResponse _$ArchiveUserImagesResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ArchiveUserImagesResponse',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['updated_images_ids', 'images_id']);
    final val = ArchiveUserImagesResponse(
      updatedImagesIds: $checkedConvert(
        'updated_images_ids',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      imagesId: $checkedConvert(
        'images_id',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'updatedImagesIds': 'updated_images_ids',
    'imagesId': 'images_id',
  },
);
