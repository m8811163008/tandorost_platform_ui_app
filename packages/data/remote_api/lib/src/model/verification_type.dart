import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum VerificationType {
  register('register'),
  forgotPassword('forgot_password'),
  securityCheck('security_check');

  final String snakeCase;
  const VerificationType(this.snakeCase);
}
