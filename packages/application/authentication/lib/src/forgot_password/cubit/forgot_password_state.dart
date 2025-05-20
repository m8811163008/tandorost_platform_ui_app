part of 'forgot_password_cubit.dart';

@immutable
class ForgotPasswordState extends Equatable{
  final String phoneNumber;
  final String password;

  final AsyncProcessingStatus forgotPasswordStatus;

  final AsyncProcessingStatus verificationStatus;
  final String verificationCode;
  final String? exception;

  const ForgotPasswordState({
    this.phoneNumber = '',
    this.password = '',
    this.verificationCode = '',
    this.forgotPasswordStatus = AsyncProcessingStatus.inital,
    this.verificationStatus = AsyncProcessingStatus.inital,
    this.exception,
  });

  ForgotPasswordState copyWith({
    String? phoneNumber,
    String? password,
    AsyncProcessingStatus? forgotPasswordStatus,
    String? verificationCode,
    AsyncProcessingStatus? verificationStatus,
    String? exception,
  }) {
    return ForgotPasswordState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      forgotPasswordStatus: forgotPasswordStatus ?? this.forgotPasswordStatus,
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
    forgotPasswordStatus,
    verificationCode,
    verificationStatus,
  ];
}
