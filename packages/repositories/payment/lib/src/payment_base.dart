import 'package:remote_api/remote_api.dart';

import 'package:rxdart/rxdart.dart';

class PaymentRepository {
  final RemoteApi _remoteApi;
  PaymentRepository({required RemoteApi remoteApi})
    : _controller = BehaviorSubject.seeded([]),
      _remoteApi = remoteApi {
    _initalize();
  }
  _initalize() async {
    final subscriptions = await _remoteApi.readSubscriptionPayments();
    _controller.add(subscriptions);
  }

  final BehaviorSubject<List<SubscriptionPayment>> _controller;

  Future<List<SubscriptionPayment>> readSubscriptionPayments() async {
    return _controller.asBroadcastStream().first;
  }

  Future<bool> get canRequestForFoodNutrition async {
    final subscriptions = await readSubscriptionPayments();
    final foodCount = await _readUserFoodCount();
    return subscriptions.any(
      (subscription) =>
          subscription.isActive &&
          foodCount.count <= subscription.userAiRequestLimitFoods,
    );
  }

  Future<void> createSubscriptionPayments(
    SubscriptionPayment subscriptionPayment,
  ) => _remoteApi.createSubscriptionPayments(subscriptionPayment);

  Future<UserFoodCount> _readUserFoodCount() => _remoteApi.readUserFoodCount();
}
