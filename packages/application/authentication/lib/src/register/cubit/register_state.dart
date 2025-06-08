part of 'register_cubit.dart';

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
    this.exception,
  });

  RegisterState copyWith({
    String? phoneNumber,
    String? password,
    AsyncProcessingStatus? registerStatus,
    String? verificationCode,
    AsyncProcessingStatus? verificationStatus,
    String? exception,
  }) {
    return RegisterState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      registerStatus: registerStatus ?? this.registerStatus,
      verificationCode: verificationCode ?? this.verificationCode,
      verificationStatus: verificationStatus ?? this.verificationStatus,
      exception: exception ?? this.exception,
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
