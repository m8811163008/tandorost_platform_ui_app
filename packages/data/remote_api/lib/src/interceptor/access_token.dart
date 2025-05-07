//'Content-Type': 'application/x-www-form-urlencoded',

import 'dart:async';

import 'package:http_interceptor/http_interceptor.dart';

class AccessTokenInterceptor implements InterceptorContract {
  final Future<String> Function() get_user_token;

  AccessTokenInterceptor(this.get_user_token);
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final token = await get_user_token();
    request.headers['Authorization'] = 'Bearer $token';
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
