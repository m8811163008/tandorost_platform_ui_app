//'Content-Type': 'application/x-www-form-urlencoded',

import 'dart:async';
import 'dart:io';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:remote_api/src/model/header_content_type.dart';
import 'package:remote_api/src/model/language.dart';

class CommonInterceptor implements InterceptorContract {
  final Future<Language> Function() userLanguageProvider;
  final ContentType acceptHeader;

  CommonInterceptor(
    this.userLanguageProvider, [
    this.acceptHeader = ContentType.applicationJson,
  ]);

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final language = await userLanguageProvider();
    request.headers[HttpHeaders.acceptLanguageHeader] = language.code;
    request.headers[HttpHeaders.acceptHeader] = acceptHeader.value;

    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async => response;

  @override
  FutureOr<bool> shouldInterceptRequest() => true;

  @override
  FutureOr<bool> shouldInterceptResponse() => false;
}
