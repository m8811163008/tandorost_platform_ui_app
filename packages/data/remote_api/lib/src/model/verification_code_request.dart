import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/src/model/verification_type.dart';
part 'verification_code_request.g.dart';

@JsonSerializable(createFactory: false)
class VerificationCodeRequest {
  final String identifier;
  @JsonKey(includeToJson: false)
  final VerificationType verificationType;

  VerificationCodeRequest({
    required this.identifier,
    required this.verificationType,
  });

  Map<String, dynamic> toJson() => _$VerificationCodeRequestToJson(this);
}
