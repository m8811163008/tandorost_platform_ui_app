import 'package:json_annotation/json_annotation.dart';

part 'credential.g.dart';

@JsonSerializable()
class Credential {
  final String grantType;

  final String username;
  final String password;

  final String scope;

  @JsonKey(name: 'client_id')
  final String clientId;

  @JsonKey(name: 'client_secret')
  final String clientSecret;

  Credential({
    this.grantType = 'password',
    required this.username,
    required this.password,
    this.scope = '',
    this.clientId = '',
    this.clientSecret = '',
  });

  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialToJson(this);
}
