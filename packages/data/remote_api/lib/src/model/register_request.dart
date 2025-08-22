import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable(createFactory: false)
class RegisterRequest {
  final String identifier;

  final String password;

  final String verificationCode;

  RegisterRequest({
    required this.identifier,
    required this.password,
    required this.verificationCode,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
