//'Content-Type': 'application/x-www-form-urlencoded',

import 'dart:async';
import 'dart:io';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:remote_api/src/model/header_content_type.dart';
import 'package:remote_api/src/model/language.dart';

class LanguageInterceptor implements InterceptorContract {
  final Future<Language> Function() get_user_language;

  LanguageInterceptor(this.get_user_language);
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final language = await get_user_language();
    request.headers[HttpHeaders.acceptLanguageHeader] = language.name;
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async => response;

  @override
  FutureOr<bool> shouldInterceptRequest() => false;

  @override
  FutureOr<bool> shouldInterceptResponse() => true;
}
