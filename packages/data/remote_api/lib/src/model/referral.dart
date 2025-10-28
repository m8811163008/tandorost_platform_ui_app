import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Required for the generated file
part 'referral.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum ReferralStatus { pending, claimed, expired }

// Equivalent to the Pydantic BaseModel 'Referral'
@JsonSerializable()
class Referral extends Equatable {
  // Pydantic's 'id: str | None = Field(alias="_id", default=None)'
  // is mapped to '_id' in JSON but named 'id' in Dart.
  final String? id;
  final String inviterId;

  final String invitedContact;

  // referral_value maps to referral_code/referral_value
  final String? referralValue;

  // Pydantic's 'referral_benefit'
  final String? referralBenefit;

  // Status: Dart Enum
  final ReferralStatus? status;

  final String? invitedUserId;

  // Timestamps: Dart uses DateTime for timestamps
  final DateTime createdAt;
  final DateTime updatedAt;

  Referral({
    required this.inviterId,
    required this.invitedContact,
    required this.createdAt,
    required this.updatedAt,
    this.id,
    this.referralValue,
    this.referralBenefit,
    this.status,
    this.invitedUserId,
  });

  // Factory constructor for deserialization (from JSON)
  factory Referral.fromJson(Map<String, dynamic> json) =>
      _$ReferralFromJson(json);

  // Method for serialization (to JSON)
  Map<String, dynamic> toJson() => _$ReferralToJson(this);

  Referral copyWith({
    ValueGetter<String?>? id,
    String? inviterId,
    String? invitedContact,
    ValueGetter<String?>? referralValue,
    ValueGetter<String?>? referralBenefit,
    ValueGetter<ReferralStatus?>? status,
    ValueGetter<String?>? invitedUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Referral(
      id: id != null ? id() : this.id,
      inviterId: inviterId ?? this.inviterId,
      invitedContact: invitedContact ?? this.invitedContact,
      referralValue: referralValue != null
          ? referralValue()
          : this.referralValue,
      referralBenefit: referralBenefit != null
          ? referralBenefit()
          : this.referralBenefit,
      status: status != null ? status() : this.status,
      invitedUserId: invitedUserId != null
          ? invitedUserId()
          : this.invitedUserId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    inviterId,
    invitedContact,
    referralValue,
    referralBenefit,
    status,
    invitedUserId,
    createdAt,
    updatedAt,
  ];
}
