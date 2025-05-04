import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/src/model/verification_type.dart';
part 'verification_code_request.g.dart';

@JsonSerializable()
class VerificationCodeRequest {
  final String phoneNumber;
  final VerificationType verificationType;

  VerificationCodeRequest({
    required this.phoneNumber,
    required this.verificationType,
  });
  factory VerificationCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$VerificationCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationCodeRequestToJson(this);
}
