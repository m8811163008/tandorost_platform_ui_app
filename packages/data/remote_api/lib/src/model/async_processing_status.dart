enum AsyncProcessingStatus {
  inital,
  loading,
  success,
  internetConnectionError,
  connectionError;

  bool get isInital => this == AsyncProcessingStatus.inital;
  bool get isLoading => this == AsyncProcessingStatus.loading;
  bool get isSuccess => this == AsyncProcessingStatus.success;
  bool get isInternetConnectionError =>
      this == AsyncProcessingStatus.internetConnectionError;
  bool get isConnectionError => this == AsyncProcessingStatus.connectionError;
  bool get isError => isInternetConnectionError || isConnectionError;
}
