import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum ChangeWeightSpeed { constant, slowAndEasy, medium,fast, fastAndHard }
