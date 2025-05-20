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
  final String phoneNumber;
  final String password;

  final AsyncProcessingStatus registerStatus;

  final AsyncProcessingStatus verificationStatus;
  final String verificationCode;
  final String? exception;

  const RegisterState({
    this.phoneNumber = '',
    this.password = '',
    this.verificationCode = '',
    this.registerStatus = AsyncProcessingStatus.inital,
    this.verificationStatus = AsyncProcessingStatus.inital,
    this.exception
  });

  RegisterState copyWith({
    String? phoneNumber,
    String? password,
    AsyncProcessingStatus? registerStatus,
    String? verificationCode,
    AsyncProcessingStatus? verificationStatus,
    String? exception
  }) {
    return RegisterState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      registerStatus: registerStatus ?? this.registerStatus,
      verificationCode: verificationCode ?? this.verificationCode,
      verificationStatus: verificationStatus ?? this.verificationStatus,
      exception : exception ?? this.exception
    );
  }

  @override
  List<Object?> get props => [
    phoneNumber,
    password,
exception,
    registerStatus,
    verificationCode,
    verificationStatus,
  ];
}
