import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_request.g.dart';

@JsonSerializable(createFactory: false)
class ForgotPasswordRequest {
  final String identifier;

  final String newPassword;

  final String verificationCode;

  ForgotPasswordRequest({
    required this.identifier,
    required this.newPassword,
    required this.verificationCode,
  });


  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);
}
