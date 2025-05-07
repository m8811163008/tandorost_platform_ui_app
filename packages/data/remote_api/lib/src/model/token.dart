import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable(createToJson: false)
class Token {
  final String id;
  final String userId;
  final String accessToken;
  final String tokenType;

  Token({
    required this.id,
    required this.userId,
    required this.accessToken,
    required this.tokenType,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
