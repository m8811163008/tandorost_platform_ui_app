import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:payment_repository/payment.dart';
import 'package:poolakey_flutter/poolakey_flutter.dart';
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

    userProfileSubscription = profileRepository.userProfileStream.listen((
      profile,
    ) {
      if (profile == null) return;
      _enhancedEmit(state.copyWith(userProfile: () => profile));
    });
    await onReadCoffeBazzarPaymentInfo();
  }

  final ProfileRepository profileRepository;
  final PaymentRepository paymentRepository;
  late final StreamSubscription<UserProfile?> userProfileSubscription;

  // Paymet process
  // onReadCoffeBazzarPaymentInfo
  // read payment info
  // connect
  // read user profile
  // subscribe
  // read skus
  // consume it
  // log purchase info
  @override
  Future<void> close() async {
    await userProfileSubscription.cancel();
    return super.close();
  }

  Future<void> onReadCoffeBazzarPaymentInfo() async {
    _enhancedEmit(
      state.copyWith(
        readCoffeBazzarPaymentStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final cafeBazzarPaymentInfo = await paymentRepository
          .readCoffeBazzarPayment();
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
      // await PoolakeyFlutter.connect(
      //   state.cafeBazzarPaymentInfo!.caffeBazzarRsa,
      //   onDisconnected: () async => onConnectToCofeBazzar(),
      // );
      await PoolakeyFlutter.connect(
        state.cafeBazzarPaymentInfo!.caffeBazzarRsa,
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

  void onCafeBazzarSubscribe(CoachProgram program) async {
    _enhancedEmit(
      state.copyWith(
        onCafeBazzarSubscribeStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final purchaseInfo = await PoolakeyFlutter.purchaseProduct(
        _sku(program),
        payload: json.encode(state.userProfile!.toJson()),
      );
      // await PoolakeyFlutter.consumeProduct(purchaseInfo.purchaseToken);
      // consume
      // bool? response = await PoolakeyFlutter.consume(purchaseInfo.purchaseToken);

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

  void onCreatePurchasePayments() async {
    if (state.cafeBazzarPaymentInfo == null ||
        state.skuDetails.isEmpty ||
        state.userProfile == null) {
      return;
    }
    //check sku
    //await for proper implementation from the backend
    // after it consume purchase
    final sku = state.purchaseInfo!.productId;
    final skuDetail = "state.skuDetails.singleWhere(";
    //   (skuDetail) => skuDetail.sku == sku,
    // );
    final subscriptionPayment = SubscriptionPayment(
      userId: state.userProfile!.id,
      paidAmount: 1, //"skuDetail.price.toRialDouble()",
      discountAmount: 0,
      currency: Currency.irRial,
      paymentMethod: PaymentMethod.inAppPaymentCafeBazzar,
      purchaseDate: DateTime.fromMillisecondsSinceEpoch(
        state.purchaseInfo!.purchaseTime,
      ),
      subscriptionType: SubscriptionType.threeMonth,
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
      final skus = await PoolakeyFlutter.getPurchasedProducts();
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

  String _sku(CoachProgram program) {
    return switch (program.price) {
      PriceLabel.p1 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan1,
      PriceLabel.p2 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan2,
      PriceLabel.p3 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan3,
      PriceLabel.p4 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan4,
      PriceLabel.p5 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan5,
      PriceLabel.p6 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan6,
      PriceLabel.p7 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan7,
      PriceLabel.p8 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan8,
      PriceLabel.p9 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan9,
      PriceLabel.p10 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan10,
      PriceLabel.p11 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan11,
      PriceLabel.p12 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan12,
      PriceLabel.p13 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan13,
      PriceLabel.p14 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan14,
      PriceLabel.p15 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan15,
      PriceLabel.p16 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan16,
      PriceLabel.p17 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan17,
      PriceLabel.p18 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan18,
      PriceLabel.p19 => state.cafeBazzarPaymentInfo!.caffeBazzarPurchasePlan19,
    };
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
