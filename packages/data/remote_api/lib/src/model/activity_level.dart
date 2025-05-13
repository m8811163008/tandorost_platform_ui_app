import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum ActivityLevel {
  sedentary,
  fairyActive,
  moderatelyActive,
  active,
  veryActive,
  other,
}

