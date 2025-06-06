import 'dart:convert';
import 'dart:io';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:food_input/food_input.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payment_repository/payment.dart';
import 'package:profile/profile.dart';
import 'package:record/record.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:flutter_poolakey/flutter_poolakey.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required this.foodInputRepository,
    required this.profileRepository,
    required this.paymentRepository,
  }) : recorder = AudioRecorder(),
       super(SearchState()) {
    _init();
  }

  @override
  Future<void> close() async {
    await recorder.dispose();
    super.close();
  }

  void resetStatus() {
    _enhancedEmit(
      state.copyWith(
        searchFoodsByTextInputStatus: AsyncProcessingStatus.inital,

        searchFoodsByVoiceInputStatus: AsyncProcessingStatus.inital,
        foodName: '',
      ),
    );
  }

  void _init() async {
    final language = await profileRepository.userSpokenLanguage;
    _enhancedEmit(state.copyWith(userSpokenLanguage: () => language));
    await onRequestRecorderPremission();
    await _canRequestForFoodNutrition();
    await onReadCoffeBazzarPaymentInfo();
  }

  final FoodInputRepository foodInputRepository;
  final ProfileRepository profileRepository;
  final PaymentRepository paymentRepository;
  final AudioRecorder recorder;

  Future<void> onRequestRecorderPremission() async {
    final result = await recorder.hasPermission();
    _enhancedEmit(state.copyWith(isRecorderPermissionAllowed: result));
  }

  // Paymet process
  // _canRequestForFoodNutrition if !state.canRequestForFoodNutrition
  // onConnectToCofeBazzar
  // onReadUserProfile
  // onCafeBazzarSubscribe
  // onReadCafeBazzarSkus
  // onCreateSubscriptionPayments

  // onCreateSubscriptionPayments
  void onSearchByVoicePressedDown() async {
    // To fix first time getting permission.
    if (state.isRecorderPermissionAllowed && state.canRequestForFoodNutrition) {
      String path = '';
      if (!kIsWeb) {
        final tempDir = await getTemporaryDirectory();
        path = '${tempDir.path}/record.wav';
      }
      await recorder.start(const RecordConfig(), path: path);
    }
  }

  void onFoodSearchChanged(String value) {
    _enhancedEmit(state.copyWith(foodName: value));
  }

  void onChangeLanguage(Language? language) async {
    if (language != null) {
      await profileRepository.upsertUserSpokenLanguage(language);
      _enhancedEmit(state.copyWith(userSpokenLanguage: () => language));
    }
  }

  void onSearchByVoicePressedUp() async {
    final out = await recorder.stop();
    if (out == null) {
      return;
    }

    _enhancedEmit(
      state.copyWith(
        searchFoodsByVoiceInputStatus: AsyncProcessingStatus.loading,
      ),
    );
    late Uint8List bytes;
    if (!kIsWeb) {
      final file = File(out);
      bytes = await file.readAsBytes();
    } else {
      final file = PickedFile(out);
      bytes = await file.readAsBytes();
    }
    final fileDetail = FileDetail(
      fileName: 'user_voice_foods.wav',
      bytes: bytes,
    );
    await _canRequestForFoodNutrition();
    if (!state.canRequestForFoodNutrition) {
      return;
    }
    await onReadFoodsNutritionsByVoice(fileDetail);
  }

  Future<void> onReadFoodsNutritionsByVoice(FileDetail fileDetail) async {
    try {
      final userLanguage = await profileRepository.userLanguage();
      await foodInputRepository.readFoodsNutritionsByVoice(
        prompt: fileDetail,
        userSpokenLanguage: state.userSpokenLanguage ?? userLanguage,
      );
      _enhancedEmit(
        state.copyWith(
          searchFoodsByVoiceInputStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          searchFoodsByVoiceInputStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          searchFoodsByVoiceInputStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readFoodsNutritionsByText() async {
    await _canRequestForFoodNutrition();
    if (!state.canRequestForFoodNutrition) {
      return;
    }
    _enhancedEmit(
      state.copyWith(
        searchFoodsByTextInputStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      await foodInputRepository.readFoodsNutritionsByText(state.foodName);
      _enhancedEmit(
        state.copyWith(
          searchFoodsByTextInputStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          searchFoodsByTextInputStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          searchFoodsByTextInputStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  Future<void> _canRequestForFoodNutrition() async {
    _enhancedEmit(
      state.copyWith(
        canRequestForFoodNutritionStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final canRequestForFoodNutrition =
          await paymentRepository.canRequestForFoodNutrition;
      _enhancedEmit(
        state.copyWith(
          canRequestForFoodNutrition: canRequestForFoodNutrition,
          canRequestForFoodNutritionStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          canRequestForFoodNutritionStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          canRequestForFoodNutritionStatus:
              AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  Future<void> onReadCoffeBazzarPaymentInfo() async {
    if (isClosed) return;
    _enhancedEmit(
      state.copyWith(
        readCoffeBazzarPaymentStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final cafeBazzarPaymentInfo =
          await paymentRepository.readCoffeBazzarPayment();
      _enhancedEmit(
        state.copyWith(
          cafeBazzarPaymentInfo: () => cafeBazzarPaymentInfo,
          readCoffeBazzarPaymentStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readCoffeBazzarPaymentStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readCoffeBazzarPaymentStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onConnectToCofeBazzar() async {
    if (state.cafeBazzarPaymentInfo == null) return;
    _enhancedEmit(
      state.copyWith(
        coffeBazzarConnectionStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final res = await FlutterPoolakey.connect(
        state.cafeBazzarPaymentInfo!.caffeBazzarRsa,
        onDisconnected: () async => onConnectToCofeBazzar(),
      );
      _enhancedEmit(
        state.copyWith(
          coffeBazzarConnectionStatus: AsyncProcessingStatus.success,
        ),
      );
    } on PlatformException catch (e) {
      if (e.message?.contains('BazaarNotFoundException') ?? false) {
        _enhancedEmit(
          state.copyWith(
            coffeBazzarConnectionStatus: AsyncProcessingStatus.connectionError,
          ),
        );
      }
    }
  }

  void onChangeSelectedSubscriptionType(SubscriptionType subscriptionType) {
    _enhancedEmit(state.copyWith(selectedSubscriptionType: subscriptionType));
  }

  void onCafeBazzarSubscribe() async {
    _enhancedEmit(
      state.copyWith(
        onCafeBazzarSubscribeStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final sku =
          state.selectedSubscriptionType! == SubscriptionType.oneMonth
              ? state
                  .cafeBazzarPaymentInfo!
                  .caffeBazzarSubscriptionPlanOneMonthSdk
              : state
                  .cafeBazzarPaymentInfo!
                  .caffeBazzarSubscriptionPlanThreeMonthSdk;
      final purchaseInfo = await FlutterPoolakey.subscribe(
        sku,
        payload: json.encode(state.userProfile!.toJson()),
      );

      _enhancedEmit(
        state.copyWith(
          onCafeBazzarSubscribeStatus: AsyncProcessingStatus.success,
          purchaseInfo: () => purchaseInfo,
        ),
      );
    } on Exception catch (e) {
      _enhancedEmit(
        state.copyWith(
          onCafeBazzarSubscribeStatus: AsyncProcessingStatus.connectionError,
          exceptionDetail: () => e.toString(),
        ),
      );
    }
  }

  void onCreateSubscriptionPayments() async {
    if (state.cafeBazzarPaymentInfo == null ||
        state.skuDetails.isEmpty ||
        state.userProfile == null) {
      return;
    }
    if (state.subscriptionPayment == null) return;
    final sku =
        state.selectedSubscriptionType! == SubscriptionType.oneMonth
            ? state
                .cafeBazzarPaymentInfo!
                .caffeBazzarSubscriptionPlanOneMonthSdk
            : state
                .cafeBazzarPaymentInfo!
                .caffeBazzarSubscriptionPlanThreeMonthSdk;
    final skuDetail = state.skuDetails.singleWhere(
      (skuDetail) => skuDetail.sku == sku,
    );
    final subscriptionPayment = SubscriptionPayment(
      userId: state.userProfile!.id,
      paidAmount: double.parse(skuDetail.price),
      discountAmount: 0,
      currency: Currency.irRial,
      paymentMethod: PaymentMethod.inAppPaymentCafeBazzar,
      purchaseDate: DateTime.fromMillisecondsSinceEpoch(
        state.purchaseInfo!.purchaseTime,
      ),
      subscriptionType: state.selectedSubscriptionType!,
    );
    _enhancedEmit(
      state.copyWith(
        onCreateSubscriptionPaymentsStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      await paymentRepository.createSubscriptionPayments(subscriptionPayment);
      _enhancedEmit(
        state.copyWith(
          onCreateSubscriptionPaymentsStatus: AsyncProcessingStatus.success,
        ),
      );
    } on Exception catch (e) {
      _enhancedEmit(
        state.copyWith(
          onCreateSubscriptionPaymentsStatus:
              AsyncProcessingStatus.connectionError,
          exceptionDetail: () => e.toString(),
        ),
      );
    }
  }

  void onReadUserProfile() async {
    _enhancedEmit(
      state.copyWith(onReadUserProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      final profile = await profileRepository.userProfile();
      _enhancedEmit(
        state.copyWith(
          onReadUserProfileStatus: AsyncProcessingStatus.success,
          userProfile: () => profile,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadUserProfileStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadUserProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onReadCafeBazzarSkus() async {
    if (state.cafeBazzarPaymentInfo == null) {
      return;
    }
    _enhancedEmit(
      state.copyWith(onReadCafeBazzarSkusStatus: AsyncProcessingStatus.loading),
    );
    try {
      final skus = await FlutterPoolakey.getSubscriptionSkuDetails([
        state.cafeBazzarPaymentInfo!.caffeBazzarSubscriptionPlanOneMonthSdk,
        state.cafeBazzarPaymentInfo!.caffeBazzarSubscriptionPlanThreeMonthSdk,
      ]);
      _enhancedEmit(
        state.copyWith(
          skuDetails: skus,
          onReadCafeBazzarSkusStatus: AsyncProcessingStatus.success,
        ),
      );
    } on Exception catch (e) {
      _enhancedEmit(
        state.copyWith(
          onReadCafeBazzarSkusStatus: AsyncProcessingStatus.connectionError,
          exceptionDetail: () => e.toString(),
        ),
      );
    }
  }

  void _enhancedEmit(SearchState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
