import 'package:json_annotation/json_annotation.dart';

import 'package:equatable/equatable.dart';

part 'coach_profile.g.dart';

@JsonSerializable()
class CoachProfile extends Equatable {
  final String? id;
  final String userId;
  final String biography;
  final bool isActive;

  CoachProfile({
    this.id,
    required this.userId,
    required this.biography,
    required this.isActive,
  });

  CoachProfile copyWith({
    String? id,
    String? userId,
    String? biography,
    bool? isActive,
  }) {
    return CoachProfile(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      biography: biography ?? this.biography,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [biography, isActive, id, userId];
  Map<String, dynamic> toJson() => _$CoachProfileToJson(this);

  factory CoachProfile.fromJson(Map<String, dynamic> json) =>
      _$CoachProfileFromJson(json);
}
