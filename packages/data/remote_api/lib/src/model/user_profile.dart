import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/remote_api.dart';
import 'package:remote_api/src/model/change_weight_speed.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String phoneNumber;
  final Address? address;
  final String? fullName;
  final Language language;
  final ChangeWeightSpeed changeWeightSpeed;
  final bool isFasting;

  UserProfile copyWith({
    String? id,
    String? phoneNumber,
    Address? address,
    String? fullName,
    Language? language,
    ChangeWeightSpeed? changeWeightSpeed,
    bool? isFasting,
  }) {
    return UserProfile(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      fullName: fullName ?? this.fullName,
      language: language ?? this.language,
      changeWeightSpeed: changeWeightSpeed ?? this.changeWeightSpeed,
      isFasting: isFasting ?? this.isFasting,
    );
  }

  UserProfile({
    required this.id,
    required this.phoneNumber,
    required this.address,
    required this.fullName,
    required this.language,
    required this.changeWeightSpeed,
    required this.isFasting,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  @override
  List<Object?> get props => [
    id,
    phoneNumber,
    address,
    fullName,
    language,
    changeWeightSpeed,
    isFasting,
  ];
}
