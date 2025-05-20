import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum VerificationType {
  register('register'),
  forgotPassword('forgot_password');

  final String snakeCase;
  const VerificationType(this.snakeCase);
}
