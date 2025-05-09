import 'package:json_annotation/json_annotation.dart';

part 'archive_user_images_response.g.dart';

@JsonSerializable(createToJson: false)
class ArchiveUserImagesResponse {
  final List<String> updatedImagesIds;
  final List<String> imagesId;

  ArchiveUserImagesResponse({
    required this.updatedImagesIds,
    required this.imagesId,
  });

  factory ArchiveUserImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ArchiveUserImagesResponseFromJson(json);
}
