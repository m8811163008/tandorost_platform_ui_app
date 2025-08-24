part of 'login_cubit.dart';

@immutable
class LoginState extends Equatable {
  final String phoneNumber;
  final String password;

  final AsyncProcessingStatus loginStatus;
  final AsyncProcessingStatus initializingGoogleAuthStatus;

  final String? exception;
  final GoogleSignInException? googleSignInException;

  const LoginState({
    this.phoneNumber = '',
    this.password = '',
    this.loginStatus = AsyncProcessingStatus.inital,
    this.initializingGoogleAuthStatus = AsyncProcessingStatus.inital,
    this.exception,
    this.googleSignInException,
  });

  LoginState copyWith({
    String? phoneNumber,
    String? password,
    AsyncProcessingStatus? loginStatus,
    AsyncProcessingStatus? initializingGoogleAuthStatus,
    String? exception,
    GoogleSignInException? googleSignInException,
  }) {
    return LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      loginStatus: loginStatus ?? this.loginStatus,
      initializingGoogleAuthStatus:
          initializingGoogleAuthStatus ?? this.initializingGoogleAuthStatus,
      exception: exception ?? this.exception,
      googleSignInException:
          googleSignInException ?? this.googleSignInException,
    );
  }

  @override
  List<Object?> get props => [
    phoneNumber,
    password,
    exception,
    loginStatus,
    initializingGoogleAuthStatus,
    googleSignInException,
  ];
}
