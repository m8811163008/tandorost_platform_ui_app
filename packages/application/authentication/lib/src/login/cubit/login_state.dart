part of 'login_cubit.dart';

@immutable
class LoginState extends Equatable {
  final String phoneNumber;
  final String password;

  final AsyncProcessingStatus loginStatus;
  final AsyncProcessingStatus onVerifyGoogleTokenStatus;
  final AsyncProcessingStatus initializingGoogleAuthStatus;
  final Credential? cachedCredential;

  final String? exception;
  final GoogleSignInException? googleSignInException;

  const LoginState({
    this.phoneNumber = '',
    this.password = '',
    this.loginStatus = AsyncProcessingStatus.inital,
    this.onVerifyGoogleTokenStatus = AsyncProcessingStatus.inital,
    this.cachedCredential,
    this.initializingGoogleAuthStatus = AsyncProcessingStatus.inital,
    this.exception,
    this.googleSignInException,
  });

  LoginState copyWith({
    String? phoneNumber,
    String? password,
    AsyncProcessingStatus? loginStatus,
    AsyncProcessingStatus? initializingGoogleAuthStatus,
    AsyncProcessingStatus? onVerifyGoogleTokenStatus,
    String? exception,
    GoogleSignInException? googleSignInException,
    Credential? cachedCredential,
  }) {
    return LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      loginStatus: loginStatus ?? this.loginStatus,
      onVerifyGoogleTokenStatus:
          onVerifyGoogleTokenStatus ?? this.onVerifyGoogleTokenStatus,
      initializingGoogleAuthStatus:
          initializingGoogleAuthStatus ?? this.initializingGoogleAuthStatus,
      exception: exception ?? this.exception,
      googleSignInException:
          googleSignInException ?? this.googleSignInException,
      cachedCredential: cachedCredential ?? this.cachedCredential,
    );
  }

  @override
  List<Object?> get props => [
    phoneNumber,
    password,
    exception,
    cachedCredential,
    loginStatus,
    initializingGoogleAuthStatus,
    googleSignInException,
    onVerifyGoogleTokenStatus,
  ];
}
