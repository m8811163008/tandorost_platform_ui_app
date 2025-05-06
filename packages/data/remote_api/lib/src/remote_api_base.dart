import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:remote_api/src/interceptor/interceptor.dart';
import 'package:remote_api/src/model/model.dart';
import 'package:remote_api/src/remote_api.dart';
import 'package:remote_api/src/utility/utility.dart';

class RemoteApiBase implements RemoteApi {
  RemoteApiBase({required this.get_user_language});
  static const _message = 'message';
  static const _data = 'data';

  Future<Language> Function() get_user_language;

  Future<SuccessResponse> sendVerificationCode({
    required VerificationCodeRequest verificationCodeRequest,
  }) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        LanguageInterceptor(get_user_language),
        ContentTypeInterceptor(
          contentType: ContentType.applicationXWwwFormUrlencoded,
        ),
      ],
    );
    final uri = UriBuilder.authSendVerificationCode(
      verificationCodeRequest.verificationType,
    );
    final res = await _handleRequest(
      () => interceptedHttp.post(uri, body: verificationCodeRequest.toJson()),
    );
    final message = jsonDecode(res.body)[_message];
    return SuccessResponse(message: message);
  }

  Future<Response> _handleRequest(Future<Response> Function() request) async {
    try {
      final res = await request();
      if (res.statusCode == 422) {
        final body = jsonDecode(res.body);
        throw ValidationErrors.fromJson(body);
      }

      return res;
    } on Exception catch (e) {
      print(e);
      rethrow;
    } on ValidationError {
      rethrow;
    } on HttpException {
      rethrow;
    } on SocketException {
      if (!await hasInternetConnection()) {
        throw InternetConnectionException();
      }
      throw HttpException('SocketException');
    } on TimeoutException {
      throw HttpException('TimeoutException');
    } on HandshakeException {
      throw HttpException('HandshakeException: SSL/TLS handshake failed');
    } on TlsException {
      throw HttpException('TlsException: TLS/SSL error occurred');
    } on OSError catch (e) {
      throw HttpException('OSError: ${e.message}');
    } catch (e) {
      throw HttpException(e.toString());
    }
  }
}
