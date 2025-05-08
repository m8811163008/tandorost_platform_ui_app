// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bio_data.dart';

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

const _$ActivityLevelEnumMap = {
  ActivityLevel.sedentary: 'sedentary',
  ActivityLevel.fairyActive: 'fairyActive',
  ActivityLevel.moderatelyActive: 'moderatelyActive',
  ActivityLevel.active: 'active',
  ActivityLevel.veryActive: 'veryActive',
  ActivityLevel.other: 'other',
};

UserBioData _$UserBioDataFromJson(Map<String, dynamic> json) => $checkedCreate(
  'UserBioData',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'id',
        'user_id',
        'gender',
        'age',
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
    final val = UserBioData(
      id: $checkedConvert('id', (v) => v as String),
      userId: $checkedConvert('user_id', (v) => v as String),
      gender: $checkedConvert('gender', (v) => $enumDecode(_$GenderEnumMap, v)),
      age: $checkedConvert('age', (v) => (v as num).toInt()),
      height: $checkedConvert(
        'height',
        (v) =>
            (v as List<dynamic>)
                .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
                .toList(),
      ),
      weight: $checkedConvert(
        'weight',
        (v) =>
            (v as List<dynamic>)
                .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
                .toList(),
      ),
      waistCircumference: $checkedConvert(
        'waist_circumference',
        (v) =>
            (v as List<dynamic>)
                .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
                .toList(),
      ),
      armCircumference: $checkedConvert(
        'arm_circumference',
        (v) =>
            (v as List<dynamic>)
                .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
                .toList(),
      ),
      chestCircumference: $checkedConvert(
        'chest_circumference',
        (v) =>
            (v as List<dynamic>)
                .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
                .toList(),
      ),
      thighCircumference: $checkedConvert(
        'thigh_circumference',
        (v) =>
            (v as List<dynamic>)
                .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
                .toList(),
      ),
      calfMuscleCircumference: $checkedConvert(
        'calf_muscle_circumference',
        (v) =>
            (v as List<dynamic>)
                .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
                .toList(),
      ),
      hipCircumference: $checkedConvert(
        'hip_circumference',
        (v) =>
            (v as List<dynamic>)
                .map((e) => DoubleDataPoint.fromJson(e as Map<String, dynamic>))
                .toList(),
      ),
      activityLevel: $checkedConvert(
        'activity_level',
        (v) =>
            (v as List<dynamic>)
                .map(
                  (e) => ActivityLevelDataPoint.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
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

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};
