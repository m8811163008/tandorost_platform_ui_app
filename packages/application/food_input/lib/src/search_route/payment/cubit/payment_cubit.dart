import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_poolakey/flutter_poolakey.dart';
import 'package:food_input/food_input.dart';
import 'package:payment_repository/payment.dart';
import 'package:profile/profile.dart';
import 'package:tandorost_components/tandorost_components.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({
    required this.profileRepository,
    required this.paymentRepository,
  }) : super(PaymentState()) {
    _init();
  }

  void _init() async {
    // payment
    await onReadCoffeBazzarPaymentInfo();
    userProfileSubscription = profileRepository.userProfileStream.listen((
      profile,
    ) {
      if (profile == null) return;
      _enhancedEmit(state.copyWith(userProfile: () => profile));
    });
  }

  final ProfileRepository profileRepository;
  final PaymentRepository paymentRepository;
  late final StreamSubscription<UserProfile?> userProfileSubscription;

  // Paymet process
  // _canRequestForFoodNutrition if !state.canRequestForFoodNutrition
  // onConnectToCofeBazzar
  // onReadUserProfile
  // onCafeBazzarSubscribe
  // onReadCafeBazzarSkus
  // onCreateSubscriptionPayments
  // onCreateSubscriptionPayments
  @override
  Future<void> close() async {
    await userProfileSubscription.cancel();
    return super.close();
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
      await FlutterPoolakey.connect(
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
      final subscriptionType = state.selectedSubscriptionType;
      assert(
        subscriptionType != null,
        'state.selectedSubscriptionType is null',
      );
      final sku = switch (subscriptionType) {
        SubscriptionType.oneMonth =>
          state.cafeBazzarPaymentInfo!.caffeBazzarSubscriptionPlanOneMonthSdk,
        SubscriptionType.threeMonth =>
          state.cafeBazzarPaymentInfo!.caffeBazzarSubscriptionPlanThreeMonthSdk,
        SubscriptionType.sixMonth =>
          state.cafeBazzarPaymentInfo!.caffeBazzarSubscriptionPlanSixMonthSdk,
        _ => throw Exception('state.selectedSubscriptionType is null'),
      };
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

  void onReadUserProfile() async {
    _enhancedEmit(
      state.copyWith(onReadUserProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      await profileRepository.userProfile();
      _enhancedEmit(
        state.copyWith(onReadUserProfileStatus: AsyncProcessingStatus.success),
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

  void onCreateSubscriptionPayments() async {
    if (state.cafeBazzarPaymentInfo == null ||
        state.skuDetails.isEmpty ||
        state.userProfile == null) {
      return;
    }

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
      paidAmount: skuDetail.price.toRialDouble(),
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

  void _enhancedEmit(PaymentState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}

extension PersianRialParser on String {
  /// Parses a Persian Rial price string like '۳,۱۱۰,۰۰۰ ریال' and returns the double value.
  /// Example: '۳,۱۱۰,۰۰۰ ریال' => 3110000.0
  double toRialDouble() {
    // Remove 'ریال' and whitespace
    String cleaned = replaceAll('ریال', '').replaceAll(' ', '');
    // Remove commas
    cleaned = cleaned.replaceAll(',', '');
    // Convert Persian digits to English digits
    const persian = '۰۱۲۳۴۵۶۷۸۹';
    const english = '0123456789';
    StringBuffer buffer = StringBuffer();
    for (var ch in cleaned.split('')) {
      int idx = persian.indexOf(ch);
      buffer.write(idx == -1 ? ch : english[idx]);
    }
    return double.tryParse(buffer.toString()) ?? 0.0;
  }
}
