enum AsyncProcessingStatus {
  inital,
  loading,
  success,
  internetConnectionError,
  serverConnectionError;

  bool get isInital => this == AsyncProcessingStatus.inital;
  bool get isLoading => this == AsyncProcessingStatus.loading;
  bool get isSuccess => this == AsyncProcessingStatus.success;
  bool get isInternetConnectionError =>
      this == AsyncProcessingStatus.internetConnectionError;
  bool get isServerConnectionError =>
      this == AsyncProcessingStatus.serverConnectionError;
  bool get isError => isInternetConnectionError || isServerConnectionError;
}
