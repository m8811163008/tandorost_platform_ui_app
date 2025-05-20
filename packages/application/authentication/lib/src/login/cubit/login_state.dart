part of 'login_cubit.dart';

@immutable
class LoginState extends Equatable {
  final String phoneNumber;
  final String password;

  final AsyncProcessingStatus loginStatus;

  final String? exception;

  const LoginState({
    this.phoneNumber = '',
    this.password = '',
    this.loginStatus = AsyncProcessingStatus.inital,
    this.exception,
  });

  LoginState copyWith({
    String? phoneNumber,
    String? password,
    AsyncProcessingStatus? loginStatus,
    String? exception,
  }) {
    return LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      loginStatus: loginStatus ?? this.loginStatus,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [phoneNumber, password, exception, loginStatus];
}
