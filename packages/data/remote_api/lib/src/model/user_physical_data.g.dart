// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_physical_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoubleDataPoint _$DoubleDataPointFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DoubleDataPoint',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['data_point_id', 'value', 'create_date'],
        );
        final val = DoubleDataPoint(
          value: $checkedConvert('value', (v) => (v as num).toDouble()),
          createDate: $checkedConvert(
            'create_date',
            (v) => DateTime.parse(v as String),
          ),
          dataPointId: $checkedConvert('data_point_id', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'createDate': 'create_date',
        'dataPointId': 'data_point_id',
      },
    );

Map<String, dynamic> _$DoubleDataPointToJson(DoubleDataPoint instance) =>
    <String, dynamic>{
      'data_point_id': instance.dataPointId,
      'value': instance.value,
      'create_date': instance.createDate.toIso8601String(),
    };

ActivityLevelDataPoint _$ActivityLevelDataPointFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ActivityLevelDataPoint',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const ['data_point_id', 'value', 'create_date'],
    );
    final val = ActivityLevelDataPoint(
      value: $checkedConvert(
        'value',
        (v) => $enumDecode(_$ActivityLevelEnumMap, v),
      ),
      createDate: $checkedConvert(
        'create_date',
        (v) => DateTime.parse(v as String),
      ),
      dataPointId: $checkedConvert('data_point_id', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'createDate': 'create_date',
    'dataPointId': 'data_point_id',
  },
);

Map<String, dynamic> _$ActivityLevelDataPointToJson(
  ActivityLevelDataPoint instance,
) => <String, dynamic>{
  'data_point_id': instance.dataPointId,
  'value': _$ActivityLevelEnumMap[instance.value]!,
  'create_date': instance.createDate.toIso8601String(),
};

const _$ActivityLevelEnumMap = {
  ActivityLevel.sedentary: 'sedentary',
  ActivityLevel.fairyActive: 'fairy_active',
  ActivityLevel.moderatelyActive: 'moderately_active',
  ActivityLevel.active: 'active',
  ActivityLevel.veryActive: 'very_active',
  ActivityLevel.other: 'other',
};

UserPhysicalProfile _$UserPhysicalProfileFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UserPhysicalProfile',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        '_id',
        'user_id',
        'gender',
        'birthday',
        'height',
        'weight',
        'waist_circumference',
        'arm_circumference',
        'chest_circumference',
        'thigh_circumference',
        'calf_muscle_circumference',
        'hip_circumference',
        'activity_level',
      ],
    );
    final val = UserPhysicalProfile(
      id: $checkedConvert('_id', (v) => v as String),
      userId: $checkedConvert('user_id', (v) => v as String),
      gender: $checkedConvert('gender', (v) => $enumDecode(_$GenderEnumMap, v)),
      birthday: $checkedConvert('birthday', (v) => DateTime.parse(v as String)),
      height: $checkedConvert(
        'height',
        (v) => (v as List<dynamic>)
            .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      weight: $checkedConvert(
        'weight',
        (v) => (v as List<dynamic>)
            .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      waistCircumference: $checkedConvert(
        'waist_circumference',
        (v) => (v as List<dynamic>)
            .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      armCircumference: $checkedConvert(
        'arm_circumference',
        (v) => (v as List<dynamic>)
            .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      chestCircumference: $checkedConvert(
        'chest_circumference',
        (v) => (v as List<dynamic>)
            .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      thighCircumference: $checkedConvert(
        'thigh_circumference',
        (v) => (v as List<dynamic>)
            .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      calfMuscleCircumference: $checkedConvert(
        'calf_muscle_circumference',
        (v) => (v as List<dynamic>)
            .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      hipCircumference: $checkedConvert(
        'hip_circumference',
        (v) => (v as List<dynamic>)
            .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      activityLevel: $checkedConvert(
        'activity_level',
        (v) => (v as List<dynamic>)
            .map(
              (e) => ActivityLevelDataPoint.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'id': '_id',
    'userId': 'user_id',
    'waistCircumference': 'waist_circumference',
    'armCircumference': 'arm_circumference',
    'chestCircumference': 'chest_circumference',
    'thighCircumference': 'thigh_circumference',
    'calfMuscleCircumference': 'calf_muscle_circumference',
    'hipCircumference': 'hip_circumference',
    'activityLevel': 'activity_level',
  },
);

Map<String, dynamic> _$UserPhysicalProfileToJson(
  UserPhysicalProfile instance,
) => <String, dynamic>{
  '_id': instance.id,
  'user_id': instance.userId,
  'gender': _$GenderEnumMap[instance.gender]!,
  'birthday': instance.birthday.toIso8601String(),
  'height': instance.height.map((e) => e.toJson()).toList(),
  'weight': instance.weight.map((e) => e.toJson()).toList(),
  'waist_circumference': instance.waistCircumference
      .map((e) => e.toJson())
      .toList(),
  'arm_circumference': instance.armCircumference
      .map((e) => e.toJson())
      .toList(),
  'chest_circumference': instance.chestCircumference
      .map((e) => e.toJson())
      .toList(),
  'thigh_circumference': instance.thighCircumference
      .map((e) => e.toJson())
      .toList(),
  'calf_muscle_circumference': instance.calfMuscleCircumference
      .map((e) => e.toJson())
      .toList(),
  'hip_circumference': instance.hipCircumference
      .map((e) => e.toJson())
      .toList(),
  'activity_level': instance.activityLevel.map((e) => e.toJson()).toList(),
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.unknown: 'unknown',
};
