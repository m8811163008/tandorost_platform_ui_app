import 'package:json_annotation/json_annotation.dart';
@JsonEnum(fieldRename: FieldRename.snake)
enum GallaryTag {
  @JsonValue('default')
  defaultTag,
  profileImage,
  certificate;

  String get requestName => switch (this) {
    GallaryTag.defaultTag => 'default',
    GallaryTag.profileImage => 'profile_image',
    GallaryTag.certificate => 'certificate',
  };
}
