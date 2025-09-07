import 'dart:async';
import 'package:flutter/services.dart';

class PoolakeyFlutter {
  static const MethodChannel _channel = MethodChannel('poolakey_flutter');
  static const EventChannel _eventChannel = EventChannel(
    'poolakey_flutter_events',
  );

  /// A broadcast stream for connection events.
  /// You can listen to this stream to be notified of disconnections from Bazaar.
  static Stream<String> get connectionEvents =>
      _eventChannel.receiveBroadcastStream().cast<String>();

  /// Connects to Bazaar using the RSA public key.
  static Future<bool> connect(String rsaPublicKey) async {
    try {
      final bool result = await _channel.invokeMethod('connect', {
        'rsaPublicKey': rsaPublicKey,
      });
      return result;
    } on PlatformException catch (e) {
      throw Exception("Failed to connect to Bazaar: ${e.message}");
    }
  }

  /// Starts the purchase flow for a product.
  /// Accepts the product ID and an optional payload.
  static Future<Map<dynamic, dynamic>> purchaseProduct(
    String productId, {
    String payload = '',
  }) async {
    try {
      final Map<dynamic, dynamic> result = await _channel.invokeMethod(
        'purchaseProduct',
        {'productId': productId, 'payload': payload},
      );
      return result;
    } on PlatformException catch (e) {
      throw Exception("Failed to begin purchase flow: ${e.message}");
    }
  }

  /// Starts the purchase flow for a subscription.
  /// Accepts the product ID and an optional payload.
  static Future<Map<dynamic, dynamic>> purchaseSubscription(
    String productId, {
    String payload = '',
  }) async {
    try {
      final Map<dynamic, dynamic> result = await _channel.invokeMethod(
        'purchaseSubscription',
        {'productId': productId, 'payload': payload},
      );
      return result;
    } on PlatformException catch (e) {
      throw Exception("Failed to begin subscription flow: ${e.message}");
    }
  }

  /// Consumes a purchased product.
  /// Accepts the purchase token of the product.
  static Future<bool> consumeProduct(String purchaseToken) async {
    try {
      final bool result = await _channel.invokeMethod('consumeProduct', {
        'purchaseToken': purchaseToken,
      });
      return result;
    } on PlatformException catch (e) {
      throw Exception("Failed to consume product: ${e.message}");
    }
  }

  /// Retrieves a list of all products purchased by the user.
  static Future<List<dynamic>> getPurchasedProducts() async {
    try {
      final List<dynamic> result = await _channel.invokeMethod(
        'getPurchasedProducts',
      );
      return result;
    } on PlatformException catch (e) {
      throw Exception("Failed to get purchased products: ${e.message}");
    }
  }

  /// Retrieves a list of all active subscriptions for the user.
  static Future<List<dynamic>> getSubscribedProducts() async {
    try {
      final List<dynamic> result = await _channel.invokeMethod(
        'getSubscribedProducts',
      );
      return result;
    } on PlatformException catch (e) {
      throw Exception("Failed to get subscribed products: ${e.message}");
    }
  }

  /// Checks the trial subscription status for the user.
  static Future<Map<dynamic, dynamic>> checkTrialSubscription() async {
    try {
      final Map<dynamic, dynamic> result = await _channel.invokeMethod(
        'checkTrialSubscription',
      );
      return result;
    } on PlatformException catch (e) {
      throw Exception("Failed to check trial subscription: ${e.message}");
    }
  }
}
