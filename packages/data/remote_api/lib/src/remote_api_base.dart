import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:http_interceptor/http_interceptor.dart' as http;
import 'package:remote_api/src/interceptor/interceptor.dart';
import 'package:remote_api/src/model/model.dart';
import 'package:remote_api/src/remote_api.dart';
import 'package:remote_api/src/utility/utility.dart';
import 'package:rxdart/rxdart.dart';

typedef JsonMap = Map<String, dynamic>;

class RemoteApiBase implements RemoteApi {
  RemoteApiBase();

  late final Future<Language> Function() userLanguageProvider;

  late final Future<Token?> Function() accessTokenProvider;

  BehaviorSubject<AuthenticationStatus> _controller = BehaviorSubject.seeded(
    AuthenticationStatus.authorized,
  );
  static const _detail = 'detail';

  Stream<AuthenticationStatus> get authenticationStatusStream async* {
    // _controller.add(AuthenticationStatus.authorized);
    yield* _controller.stream.asBroadcastStream();
  }

  Future<String> sendVerificationCode({
    required VerificationCodeRequest verificationCodeRequest,
  }) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        ContentTypeInterceptor(
          requestContentType: ContentType.applicationXWwwFormUrlencoded,
        ),
      ],
    );
    final uri = UriBuilder.authSendVerificationCode(
      verificationCodeRequest.verificationType,
    );
    final res = await _handleRequest<String>(
      () => interceptedHttp.post(uri, body: verificationCodeRequest.toJson()),
    );

    return res!;
  }

  Future<String> register({required RegisterRequest registerRequest}) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        ContentTypeInterceptor(
          requestContentType: ContentType.applicationXWwwFormUrlencoded,
        ),
      ],
    );
    final uri = UriBuilder.register();
    final res = await _handleRequest<String>(
      () => interceptedHttp.post(uri, body: registerRequest.toJson()),
    );
    return res!;
  }

  Future<String> forgotPassword({
    required ForgotPasswordRequest forgotPasswordRequest,
  }) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        ContentTypeInterceptor(
          requestContentType: ContentType.applicationXWwwFormUrlencoded,
        ),
      ],
    );
    final uri = UriBuilder.forgotPasswrd();
    final res = await _handleRequest<String>(
      () => interceptedHttp.post(uri, body: forgotPasswordRequest.toJson()),
    );
    return res!;
  }

  Future<Token> authenticate({required Credential credential}) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        ContentTypeInterceptor(
          requestContentType: ContentType.applicationXWwwFormUrlencoded,
        ),
      ],
    );
    final uri = UriBuilder.authToken();
    final res = await _handleRequest<JsonMap>(
      () => interceptedHttp.post(uri, body: credential.toJson()),
    );
    if (await _controller.stream.first != AuthenticationStatus.authorized) {
      _controller.add(AuthenticationStatus.authorized);
    }

    return Token.fromJson(res!);
  }

  Future<UserProfile> userProfile() async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
      ],
    );
    final uri = UriBuilder.userProfile();
    final res = await _handleRequest<JsonMap>(() => interceptedHttp.get(uri));
    print(res);
    return UserProfile.fromJson(res!);
  }

  Future<UserProfile> updateProfile(UserProfile updatedProfile) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
        AccessTokenInterceptor(accessTokenProvider),
      ],
    );
    final uri = UriBuilder.updateProfile();
    final updateProfileJson = updatedProfile.toJson();
    final res = await _handleRequest<JsonMap>(
      () => interceptedHttp.put(uri, body: json.encode(updateProfileJson)),
    );
    return UserProfile.fromJson(res!);
  }

  Future<UserPhysicalProfile?> readUserPhysicalProfile() async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
      ],
    );
    final uri = UriBuilder.readUserPhysicalData();
    final res = await _handleRequest<JsonMap?>(() => interceptedHttp.get(uri));
    if (res == null) return null;
    return UserPhysicalProfile.fromJson(res);
  }

  Future<void> deleteUserPhysicalDataPoint({
    required String dataPointsId,
  }) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
      ],
    );
    final uri = UriBuilder.deleteUserPhysicalData(dataPointsId);
    await _handleRequest<JsonMap>(() => interceptedHttp.delete(uri));
  }

  Future<UserPhysicalProfile> updateUserPhysicalData(
    UserPhysicalDataUpsert userPhysicalDataUpsert,
  ) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
      ],
    );
    final uri = UriBuilder.updateUserPhysicalData();
    final userPhysicalDataUpsertJson = userPhysicalDataUpsert.toJson();
    final res = await _handleRequest<JsonMap?>(
      () => interceptedHttp.put(
        uri,
        body: json.encode(userPhysicalDataUpsertJson),
      ),
    );

    return UserPhysicalProfile.fromJson(res!);
  }

  Future<List<FileData>> readUserImageGallary(
    List<GallaryTag> gallaryTags,
  ) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
      ],
    );
    final uri = UriBuilder.readUserImageGallary(gallaryTags);
    final res = await _handleRequest<List>(() => interceptedHttp.get(uri));
    return res!.map((e) => FileData.fromJson(e)).toList();
  }

  Future<List<FileData>> readUserProfileImage() async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
      ],
    );
    final uri = UriBuilder.readUserProfileImage();
    final res = await _handleRequest<List>(() => interceptedHttp.get(uri));
    return res!.map((e) => FileData.fromJson(e)).toList();
  }

  Future<FileDetail> readImage(FileData fileData) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
      ],
    );
    final uri = UriBuilder.readImage(fileData.fileUploadPath);
    final res = await interceptedHttp.get(uri);

    return FileDetail(fileName: fileData.fileName, bytes: res.bodyBytes);
  }

  Future<ArchiveUserImagesResponse> archiveUserImages(
    List<String> imagesId,
  ) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
      ],
    );
    final uri = UriBuilder.archiveUserImages();
    final res = await _handleRequest<JsonMap>(
      () => interceptedHttp.post(uri, body: json.encode(imagesId)),
    );

    return ArchiveUserImagesResponse.fromJson(res!);
  }

  Future<List<FileData>> addUserImages(UserImage userImage) async {
    final uri = UriBuilder.addUsersImages();
    final request = http.MultipartRequest('POST', uri);

    final token = await accessTokenProvider();
    final language = await userLanguageProvider();

    request.headers.addAll({
      'Authorization': 'Bearer ${token?.accessToken}',
      HttpHeaders.acceptLanguageHeader: language.name,
      HttpHeaders.contentTypeHeader: 'multipart/form-data',
    });

    request.fields['tag'] = userImage.gallaryTag.requestName;

    for (FileDetail file in userImage.imageGallaryFiles) {
      request.files.add(
        await http.MultipartFile.fromBytes(
          'image_gallary_files',
          file.bytes,
          filename: file.fileName,
          contentType: file.mediaType,
        ),
      );
    }

    try {
      var response = await request.send();

      final jsonResponseString = await response.stream.bytesToString();
      final jsonResponse = json.decode(jsonResponseString);
      if (response.statusCode == 401) {
        await _handleAuauthorize();
        throw HttpException('');
      }

      if (response.statusCode != 200) {
        assert(jsonResponse is JsonMap);
        final response = ApiErrorResponse.fromJson(
          (jsonResponse as JsonMap)[_detail],
        );
        throw HttpException(response.message!);
      } else {
        return (jsonResponse as List).map((e) => FileData.fromJson(e)).toList();
      }
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

  Future<List<Food>> readFoodsNutritionsByText(String prompt) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
      ],
    );
    final uri = UriBuilder.readFoodsNutritionsByText();
    final res = await _handleRequest<List>(
      () => interceptedHttp.post(uri, body: json.encode(prompt)),
    );

    return res!.map((e) => Food.fromJson(e)).toList();
  }

  Future<List<Food>> readFoodsNutrition(DateTime date1, DateTime date2) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
      ],
    );
    final uri = UriBuilder.readFoodsNutritions(date1, date2);
    final res = await _handleRequest<List>(() => interceptedHttp.get(uri));

    return res!.map((e) => Food.fromJson(e)).toList();
  }

  Future<Food> updateFoodsNutritions(Food food) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
      ],
    );
    final uri = UriBuilder.updateFoodsNutritions();
    final res = await _handleRequest<JsonMap>(
      () => interceptedHttp.post(uri, body: json.encode(food.toJson())),
    );

    return Food.fromJson(res!);
  }

  Future<void> deleteFoodsNutritions(List<String> foodIds) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
      ],
    );
    final uri = UriBuilder.deleteFoodsNutritions(foodIds);
    await _handleRequest<JsonMap?>(() => interceptedHttp.delete(uri));
  }

  Future<List<Food>> readFoodsNutritionsByVoice({
    required FileDetail prompt,
    required Language userSpokenLanguage,
  }) async {
    final uri = UriBuilder.readFoodsNutritionsByVoice();
    final request = http.MultipartRequest('POST', uri);
    final token = await accessTokenProvider();
    final language = await userLanguageProvider();

    request.headers.addAll({
      'Authorization': 'Bearer ${token?.accessToken}',
      HttpHeaders.acceptLanguageHeader: language.name,
      HttpHeaders.contentTypeHeader: 'multipart/form-data',
    });

    request.fields['language'] = userSpokenLanguage.code;

    request.files.add(
      await http.MultipartFile.fromBytes(
        'prompt',
        prompt.bytes,
        filename: prompt.fileName,
        contentType: prompt.mediaType,
      ),
    );

    try {
      var response = await request.send();

      final jsonResponseString = await response.stream.bytesToString();
      final jsonResponse = json.decode(jsonResponseString);
      if (response.statusCode == 401) {
        await _handleAuauthorize();
        throw HttpException('');
      }

      if (response.statusCode != 200) {
        assert(jsonResponse is JsonMap);

        final response = ApiErrorResponse.fromJson(
          (jsonResponse as JsonMap)[_detail],
        );
        throw HttpException(response.message!);
      } else {
        return (jsonResponse as List).map((e) => Food.fromJson(e)).toList();
      }
    } on ValidationError {
      rethrow;
    } on HttpException {
      rethrow;
    } on SocketException catch (e) {
      if (!await hasInternetConnection()) {
        throw InternetConnectionException();
      }
      print(e);
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

  Future<FitnessData?> readFitnessData() async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
      ],
    );
    final uri = UriBuilder.readFitnessData();
    final res = await _handleRequest<JsonMap?>(() => interceptedHttp.get(uri));
    if (res == null) return null;

    return FitnessData.fromJson(res);
  }

  Future<NutritionRequirements?> readNutritionRequirements() async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
      ],
    );
    final uri = UriBuilder.readNutritionRequirements();
    final res = await _handleRequest<JsonMap>(() => interceptedHttp.get(uri));
    if (res == null) return null;
    return NutritionRequirements.fromJson(res);
  }

  Future<List<SubscriptionPayment>> readSubscriptionPayments() async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
      ],
    );
    final uri = UriBuilder.readSubscriptions();
    final res = await _handleRequest<List>(() => interceptedHttp.get(uri));
    return res!.map((e) => SubscriptionPayment.fromJson(e)).toList();
  }

  Future<CafeBazzarPaymentInfo> readCoffeBazzarPayment() async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
      ],
    );
    final uri = UriBuilder.readCoffeBazzarPayment();
    final res = await _handleRequest<JsonMap>(() => interceptedHttp.get(uri));
    return CafeBazzarPaymentInfo.fromJson(res!);
  }

  Future<SubscriptionPayment> createSubscriptionPayments(
    SubscriptionPayment subscriptionPayment,
  ) async {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
      ],
    );
    final uri = UriBuilder.createSubscriptionPayment();
    final res = await _handleRequest<JsonMap>(
      () => interceptedHttp.post(
        uri,
        body: json.encode(subscriptionPayment.toJson()),
      ),
    );
    return SubscriptionPayment.fromJson(res!);
  }

  Future<UserFoodCount> readUserFoodCount() {
    final interceptedHttp = InterceptedHttp.build(
      interceptors: [
        CommonInterceptor(userLanguageProvider),
        AccessTokenInterceptor(accessTokenProvider),
        ContentTypeInterceptor(requestContentType: ContentType.applicationJson),
      ],
    );
    final uri = UriBuilder.readUserFoodCount();
    return _handleRequest<JsonMap>(
      () => interceptedHttp.get(uri),
    ).then((res) => UserFoodCount.fromJson(res!));
  }

  Future<E?> _handleRequest<E>(Future<Response> Function() request) async {
    try {
      final res = await request();
      if (res.statusCode == 401) {
        await _handleAuauthorize();

        throw HttpException('');
      } else if (res.statusCode == 204 || res.statusCode == 404) {
        return null;
      } else {
        final jsonResponse = json.decode(res.body);
        if (res.statusCode != 200 && res.statusCode != 201) {
          assert(jsonResponse is JsonMap);
          final response = ApiErrorResponse.fromJson(
            (jsonResponse as JsonMap)[_detail],
          );
          throw HttpException(response.message!);
        } else {
          return jsonResponse as E;
        }
      }
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

  Future<void> _handleAuauthorize() async {
    if (await _controller.stream.first != AuthenticationStatus.unauthorized) {
      _controller.add(AuthenticationStatus.unauthorized);
    }
  }
}
