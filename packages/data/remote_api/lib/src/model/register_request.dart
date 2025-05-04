import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable(createFactory: false)
class RegisterRequest {
  final String userName;

  final String password;

  final String verificationCode;

  RegisterRequest({
    required this.userName,
    required this.password,
    required this.verificationCode,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
