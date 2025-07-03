import 'dart:async';
import 'dart:io';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:food_input/food_input.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payment_repository/payment.dart';
import 'package:profile/profile.dart';
import 'package:record/record.dart';
import 'package:tandorost_components/tandorost_components.dart';
part 'search_state.dart';

final StreamController<String?> didReceiveNotificationResponseStreamController =
    StreamController<String?>.broadcast();

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required this.foodInputRepository,
    required this.profileRepository,
    required this.paymentRepository,
    required this.flutterLocalNotificationsPlugin,
    // required this.didReceiveNotificationResponseStreamController,
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
    await initalizeNotification();
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
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  // final StreamController<String?> didReceiveNotificationResponseStreamController;

  Future<void> initalizeNotification() async {
    if (Platform.isAndroid) {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('app_icon');

      final InitializationSettings initializationSettings =
          InitializationSettings(android: initializationSettingsAndroid);
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (
          NotificationResponse notificationResponse,
        ) async {
          // todo naviagte to search page
          if (notificationResponse.input != null) {
            onFoodSearchByTextChanged(notificationResponse.input!);
            readFoodsNutritionsByText();
          }
          flutterLocalNotificationsPlugin.cancel(notificationResponse.id ?? 0);
        },
      );
      final NotificationAppLaunchDetails? notificationAppLaunchDetails =
          await flutterLocalNotificationsPlugin
              .getNotificationAppLaunchDetails();

      if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
        // If the app was launched by tapping a notification, capture the input
        final input = notificationAppLaunchDetails!.notificationResponse?.input;
        if (input != null) {
          onFoodSearchByTextChanged(input);
          readFoodsNutritionsByText();
        }
        flutterLocalNotificationsPlugin.cancel(
          notificationAppLaunchDetails.notificationResponse?.id ?? 0,
        );
      }
    }
  }

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
