// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Address',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'address_lines',
        'address_lines2',
        'city',
        'state',
        'postcode',
        'country',
      ],
    );
    final val = Address(
      addressLines: $checkedConvert('address_lines', (v) => v as String?),
      addressLines2: $checkedConvert('address_lines2', (v) => v as String?),
      city: $checkedConvert('city', (v) => v as String?),
      state: $checkedConvert('state', (v) => v as String?),
      postcode: $checkedConvert('postcode', (v) => v as String?),
      country: $checkedConvert('country', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'addressLines': 'address_lines',
    'addressLines2': 'address_lines2',
  },
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  if (instance.addressLines case final value?) 'address_lines': value,
  if (instance.addressLines2 case final value?) 'address_lines2': value,
  if (instance.city case final value?) 'city': value,
  if (instance.state case final value?) 'state': value,
  if (instance.postcode case final value?) 'postcode': value,
  if (instance.country case final value?) 'country': value,
};
