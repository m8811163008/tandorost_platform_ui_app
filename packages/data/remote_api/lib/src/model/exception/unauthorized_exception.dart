import 'dart:io';

class UnauthorizedException extends HttpException {
  UnauthorizedException([String message = 'Unauthorized']) : super(message);
}
