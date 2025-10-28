import 'dart:io';

class InternetConnectionException extends HttpException {
  InternetConnectionException([String message = 'No Internet Connection'])
    : super(message);
}

class InvalidVerification extends HttpException {
  InvalidVerification([String message = 'No Internet Connection'])
    : super(message);
}
