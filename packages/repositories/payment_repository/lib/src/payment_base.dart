import 'package:remote_api/remote_api.dart';

import 'package:rxdart/rxdart.dart';

class PaymentRepository {
  final RemoteApi _remoteApi;
  PaymentRepository({required RemoteApi remoteApi})
    : _subscriptionController = BehaviorSubject.seeded([]),

      _remoteApi = remoteApi;

  final BehaviorSubject<List<SubscriptionPayment>> _subscriptionController;

  Future<List<SubscriptionPayment>> readSubscriptionPayments() async {
    var subscriptions = _subscriptionController.value;
    if (subscriptions.isEmpty) {
      subscriptions = await _remoteApi.readSubscriptionPayments();
      _subscriptionController.add(subscriptions);
    }
    return _subscriptionController.value;
  }

  Future<UserFoodCount> _readUserFoodCount() => _remoteApi.readUserFoodCount();

  Future<CafeBazzarPaymentInfo> readCoffeBazzarPayment() =>
      _remoteApi.readCoffeBazzarPayment();

  Future<bool> get canRequestForFoodNutrition async {
    final subscriptions = await readSubscriptionPayments();
    final foodCount = await _readUserFoodCount();
    return false;
    // return subscriptions.any(
    //   (subscription) =>
    //       subscription.isActive &&
    //       foodCount.count <= subscription.userAiRequestLimitFoods!,
    // );
  }

  Future<void> createSubscriptionPayments(
    SubscriptionPayment subscriptionPayment,
  ) => _remoteApi.createSubscriptionPayments(subscriptionPayment);
}
