import 'package:json_annotation/json_annotation.dart';
import 'address.dart';
import 'language.dart';

part 'user_update_request.g.dart';

@JsonSerializable()
class UserUpdateRequest {
  final String phoneNumber;

  final Address? address;

  final String? fullName;

  final Language? language;

  UserUpdateRequest({
    required this.phoneNumber,
    this.address,
    this.fullName,
    this.language,
  });

  factory UserUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserUpdateRequestToJson(this);
}
