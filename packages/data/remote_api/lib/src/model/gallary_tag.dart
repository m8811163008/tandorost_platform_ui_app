import 'package:json_annotation/json_annotation.dart';

enum GallaryTag {
  @JsonValue('default')
  defaultTag, // Renamed to avoid conflict with reserved keyword 'default'
  profileImage,
  certificate;

  String get requestName => switch (this) {
    GallaryTag.defaultTag => 'default',
    GallaryTag.profileImage => 'profile_image',
    GallaryTag.certificate => 'certificate',
  };
}
