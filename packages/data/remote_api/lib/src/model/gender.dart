import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum Gender {
  male,
  female,
  unknown;

  bool get isMale => this == Gender.male;
}
