import 'package:json_annotation/json_annotation.dart';

import 'package:equatable/equatable.dart';

part 'coach_profile.g.dart';

@JsonSerializable()
class CoachProfile extends Equatable {
  final String biography;
  final bool isActive;

  CoachProfile({required this.biography, required this.isActive});

  CoachProfile copyWith({String? biography, bool? isActive}) {
    return CoachProfile(
      biography: biography ?? this.biography,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [biography, isActive];
  Map<String, dynamic> toJson() => _$CoachProfileToJson(this);

  factory CoachProfile.fromJson(Map<String, dynamic> json) =>
      _$CoachProfileFromJson(json);
}
