import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final String? addressLines;

  @JsonKey(name: 'address_lines2')
  final String? addressLines2;

  final String? city;
  final String? state;
  final String? postcode;
  final String? country;

  Address({
    this.addressLines,
    this.addressLines2,
    this.city,
    this.state,
    this.postcode,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
