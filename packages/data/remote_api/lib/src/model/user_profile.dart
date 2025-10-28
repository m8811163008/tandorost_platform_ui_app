import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/remote_api.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile extends Equatable {
  final String id;
  final String? phoneNumber;
  final String? email;
  final Address? address;
  final String? fullName;
  final Language language;
  final ChangeWeightSpeed changeWeightSpeed;
  final List<Role> role;
  final bool isTimeRestrictedEating;

  final String? financeCardId;

  bool get isBodybuildingCoach => role.contains(Role.bodybuildingCoach);

  UserProfile copyWith({
    String? id,
    String? phoneNumber,
    String? email,
    Address? address,
    String? fullName,
    Language? language,
    ChangeWeightSpeed? changeWeightSpeed,
    List<Role>? role,
    bool? isTimeRestrictedEating,
    String? financeCardId,
  }) {
    return UserProfile(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      address: address ?? this.address,
      fullName: fullName ?? this.fullName,
      language: language ?? this.language,
      changeWeightSpeed: changeWeightSpeed ?? this.changeWeightSpeed,
      role: role ?? this.role,
      financeCardId: financeCardId ?? this.financeCardId,
      isTimeRestrictedEating:
          isTimeRestrictedEating ?? this.isTimeRestrictedEating,
    );
  }

  UserProfile({
    required this.id,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.fullName,
    required this.language,
    required this.changeWeightSpeed,
    required this.role,
    required this.isTimeRestrictedEating,
    required this.financeCardId,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  @override
  List<Object?> get props => [
    id,
    phoneNumber,
    email,
    address,
    fullName,
    financeCardId,
    language,
    changeWeightSpeed,
    role,
    isTimeRestrictedEating,
  ];
}
