enum AuthenticationStatus {
  authorized,
  unauthorized,
  unknown;

  bool get isAuthorized => this == AuthenticationStatus.authorized;
}
