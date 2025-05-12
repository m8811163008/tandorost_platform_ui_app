import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/remote_api.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  @JsonKey(name: '_id')
  final String id;
  final String phoneNumber;
  final Address? address;
  final String? fullName;
  final Language language;

  UserProfile copyWith({
    String? id,
    String? phoneNumber,
    Address? address,
    String? fullName,
    Language? language,
  }) {
    return UserProfile(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      fullName: fullName ?? this.fullName,
      language: language ?? this.language,
    );
  }

  UserProfile({
    required this.id,
    required this.phoneNumber,
    required this.address,
    required this.fullName,
    required this.language,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
