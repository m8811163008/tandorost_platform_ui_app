//'Content-Type': 'application/x-www-form-urlencoded',

import 'dart:async';
import 'dart:io';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:remote_api/src/model/header_content_type.dart';

class ContentTypeInterceptor implements InterceptorContract {
  ContentTypeInterceptor({
    required this.requestContentType,
    this.acceptHeader = ContentType.applicationJson,
  });
  final ContentType requestContentType;
  final ContentType acceptHeader;

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    request.headers[HttpHeaders.contentTypeHeader] = requestContentType.value;
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
