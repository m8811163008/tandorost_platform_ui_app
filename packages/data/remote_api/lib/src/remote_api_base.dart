import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:remote_api/src/interceptor/interceptor.dart';
import 'package:remote_api/src/model/model.dart';
import 'package:remote_api/src/remote_api.dart';
import 'package:remote_api/src/utility/utility.dart';

typedef JsonMap = Map<String, dynamic>;

class RemoteApiBase implements RemoteApi {
  RemoteApiBase({required this.get_user_language});

  Future<Language> Function() get_user_language;
  static const _content = 'content';
  static const _detail = 'detail';

  Future<String> sendVerificationCode({
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
    final res = await _handleRequest<String>(
      () => interceptedHttp.post(uri, body: verificationCodeRequest.toJson()),
    );

    return res;
  }

  Future<String> register({required RegisterRequest registerRequest}) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        LanguageInterceptor(get_user_language),
        ContentTypeInterceptor(
          contentType: ContentType.applicationXWwwFormUrlencoded,
        ),
      ],
    );
    final uri = UriBuilder.register();
    final res = await _handleRequest<String>(
      () => interceptedHttp.post(uri, body: registerRequest.toJson()),
    );
    return res;
  }

  Future<String> forgot_password({
    required ForgotPasswordRequest forgotPasswordRequest,
  }) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        LanguageInterceptor(get_user_language),
        ContentTypeInterceptor(
          contentType: ContentType.applicationXWwwFormUrlencoded,
        ),
      ],
    );
    final uri = UriBuilder.forgotPasswrd();
    final res = await _handleRequest<String>(
      () => interceptedHttp.post(uri, body: forgotPasswordRequest.toJson()),
    );
    return res;
  }

  Future<Token> authenticate({required Credential credential}) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        LanguageInterceptor(get_user_language),
        ContentTypeInterceptor(
          contentType: ContentType.applicationXWwwFormUrlencoded,
        ),
      ],
    );
    final uri = UriBuilder.authToken();
    final res = await _handleRequest<JsonMap>(
      () => interceptedHttp.post(uri, body: credential.toJson()),
    );
    print(res);
    return Token.fromJson(res);
  }

  Future<Token> user_profile({required Credential credential}) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        LanguageInterceptor(get_user_language),
        ContentTypeInterceptor(
          contentType: ContentType.applicationXWwwFormUrlencoded,
        ),
      ],
    );
    final uri = UriBuilder.authToken();
    final res = await _handleRequest<JsonMap>(
      () => interceptedHttp.post(uri, body: credential.toJson()),
    );
    print(res);
    return Token.fromJson(res);
  }

  Future<E> _handleRequest<E>(Future<Response> Function() request) async {
    try {
      final res = await request();
      final jsonResponse = json.decode(res.body) as E;
      if (res.statusCode != 200 && res.statusCode != 201) {
        assert(jsonResponse is JsonMap);
        final response = ApiErrorResponse.fromJson((jsonResponse as JsonMap)[_detail]);
        throw HttpException(response.message!);
      } else {
        return jsonResponse;
      }

      // if (res.statusCode == 422) {
      //   final body = jsonDecode(res.body);
      //   throw ValidationErrors.fromJson(body);
      // } else if (res.statusCode == 403) {
      //   throw HttpException('HTTP_403_FORBIDDEN');
      // } else if (res.statusCode == 404) {
      //   throw HttpException('HTTP_404_NOT_FOUND');
      // } else if (res.statusCode == 400) {
      //   throw HttpException('HTTP_400_BAD_REQUEST');
      // } else if (res.statusCode == 500) {
      //   throw HttpException('HTTP_500_INTERNAL_SERVER_ERROR');
      // } else if (res.statusCode == 412) {
      //   throw HttpException('HTTP_412_PRECONDITION_FAILED');
      // } else if (res.statusCode == 503) {
      //   throw HttpException('HTTP_503_SERVICE_UNAVAILABLE');
      // } else if (res.statusCode == 504) {
      //   throw HttpException('HTTP_504_GATEWAY_TIMEOUT');
      // } else if (res.statusCode == 429) {
      //   throw HttpException('HTTP_429_TOO_MANY_REQUESTS');
      // } else if (res.statusCode == 409) {
      //   throw HttpException('HTTP_409_CONFLICT');
      // } else if (res.statusCode == 401) {
      //   throw HttpException('HTTP_401_UNAUTHORIZED');
      // }
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
      print(e);
      throw HttpException(e.toString());
    }
  }
}
