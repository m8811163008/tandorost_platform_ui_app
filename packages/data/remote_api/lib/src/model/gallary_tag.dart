import 'package:json_annotation/json_annotation.dart';

enum GallaryTag {
  @JsonValue('default')
  defaultTag, // Renamed to avoid conflict with reserved keyword 'default'
  profileImage,
  certificate,
}
