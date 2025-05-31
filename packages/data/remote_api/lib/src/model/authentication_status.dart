enum AuthenticationStatus {
  authorized,
  unauthorized;

  bool get isAuthorized => this == AuthenticationStatus.authorized;
}
