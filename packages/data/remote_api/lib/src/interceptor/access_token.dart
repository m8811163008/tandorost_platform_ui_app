//'Content-Type': 'application/x-www-form-urlencoded',

import 'dart:async';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:remote_api/remote_api.dart';

class AccessTokenInterceptor implements InterceptorContract {
  final Future<Token?> Function() accessTokenProvider;

  AccessTokenInterceptor(this.accessTokenProvider);
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final token = await accessTokenProvider();
    if (token != null) {
      request.headers['Authorization'] = 'Bearer ${token.accessToken}';
    }
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
