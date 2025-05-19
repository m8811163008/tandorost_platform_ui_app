part of 'register_cubit.dart';

//       SizedBox(height: context.sizeExtenstion.small),
//       TextField(decoration: InputDecoration(labelText: 'birthday')),
//       SizedBox(height: context.sizeExtenstion.small),
//       TextField(
//         decoration: InputDecoration(labelText: 'waist circumfrences'),
//       ),
//       SizedBox(height: context.sizeExtenstion.small),
//       TextField(decoration: InputDecoration(labelText: 'Height')),
//       SizedBox(height: context.sizeExtenstion.small),
//       TextField(decoration: InputDecoration(labelText: 'Weight')),
//       SizedBox(height: context.sizeExtenstion.small),
//       TextField(decoration: InputDecoration(labelText: 'activityLevel')),

//         final DateTime birthday;
// final TextInput height;
// final TextInput weight;
// final Gender gender;
// final ActivityLevel activityLevel;
// final TextInput? waistCircumferences;

// void onChangeBirthday(DateTime birthday) {
//   emit(state.copyWith(birthday: birthday));
// }

// void onChangeHeight(String value) {
//   emit(state.copyWith(height: TextInput.dirty(value)));
// }

// void onChangeWeight(String value) {
//   emit(state.copyWith(weight: TextInput.dirty(value)));
// }

// void onChangeWaistCircumferences(String value) {
//   emit(state.copyWith(waistCircumferences: TextInput.dirty(value)));
// }

// void onChangeActivityLevel(ActivityLevel activityLevel) {
//   emit(state.copyWith(activityLevel: activityLevel));
// }

// void onChangeGender(Gender gender) {
//   emit(state.copyWith(gender: gender));
// }
@immutable
class RegisterState extends Equatable {
  final TextInput phoneNumber;
  final TextInput password;

  final AsyncProcessingStatus registerStatus;

  final AsyncProcessingStatus verificationStatus;
  final TextInput verificationCode;

  const RegisterState({
    this.phoneNumber = const TextInput.pure(),
    this.password = const TextInput.pure(),
    this.verificationCode = const TextInput.pure(),
    this.registerStatus = AsyncProcessingStatus.inital,
    this.verificationStatus = AsyncProcessingStatus.inital,
  });

  RegisterState copyWith({
    TextInput? phoneNumber,
    TextInput? password,
    AsyncProcessingStatus? registerStatus,
    TextInput? verificationCode,
    AsyncProcessingStatus? verificationStatus,
  }) {
    return RegisterState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      registerStatus: registerStatus ?? this.registerStatus,
      verificationCode: verificationCode ?? this.verificationCode,
      verificationStatus: verificationStatus ?? this.verificationStatus,
    );
  }

  @override
  List<Object?> get props => [
    phoneNumber,
    password,

    registerStatus,
    verificationCode,
    verificationStatus,
  ];
}
