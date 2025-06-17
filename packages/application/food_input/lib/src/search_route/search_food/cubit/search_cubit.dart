import 'dart:io';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:food_input/food_input.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payment_repository/payment.dart';
import 'package:profile/profile.dart';
import 'package:record/record.dart';
import 'package:tandorost_components/tandorost_components.dart';
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

  void _init() async {
    final language = await profileRepository.userSpokenLanguage;
    _enhancedEmit(state.copyWith(userSpokenLanguage: () => language));
    await onRequestRecorderPremission();
    await _canRequestForFoodNutrition();
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

  void onChangeSpokenLanguage(Language? language) async {
    if (language != null) {
      await profileRepository.upsertUserSpokenLanguage(language);
      _enhancedEmit(state.copyWith(userSpokenLanguage: () => language));
    }
  }

  void onFoodSearchByTextChanged(String value) {
    _enhancedEmit(state.copyWith(foodName: value));
  }

  void readFoodsNutritionsByText() async {
    _enhancedEmit(
      state.copyWith(
        searchFoodsByTextInputStatus: AsyncProcessingStatus.loading,
      ),
    );
    await _canRequestForFoodNutrition();

    try {
      if (state.canRequestForFoodNutrition) {
        await foodInputRepository.readFoodsNutritionsByText(state.foodName);
      }
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

  void onSearchByVoicePressedDown() async {
    if (state.isRecorderPermissionAllowed && state.canRequestForFoodNutrition) {
      String path = '';
      if (!kIsWeb) {
        final tempDir = await getTemporaryDirectory();
        path = '${tempDir.path}/record.wav';
      }
      await recorder.start(const RecordConfig(), path: path);
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
    await _canRequestForFoodNutrition();

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

    await _onReadFoodsNutritionsByVoice(fileDetail);
  }

  Future<void> _onReadFoodsNutritionsByVoice(FileDetail fileDetail) async {
    try {
      if (state.canRequestForFoodNutrition) {
        final userLanguage = await profileRepository.userLanguage();
        await foodInputRepository.readFoodsNutritionsByVoice(
          prompt: fileDetail,
          userSpokenLanguage: state.userSpokenLanguage ?? userLanguage,
        );
      }
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

  void _enhancedEmit(SearchState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
