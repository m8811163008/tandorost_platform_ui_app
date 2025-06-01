import 'package:remote_api/remote_api.dart';

import 'package:rxdart/rxdart.dart';

class PaymentRepository {
  final RemoteApi _remoteApi;
  PaymentRepository({required RemoteApi remoteApi})
    : _subscriptionController = BehaviorSubject.seeded([]),

      _remoteApi = remoteApi {
    _initalize();
  }
  _initalize() async {
    final subscriptions = await _remoteApi.readSubscriptionPayments();

    _subscriptionController.add(subscriptions);
  }

  final BehaviorSubject<List<SubscriptionPayment>> _subscriptionController;

  Future<List<SubscriptionPayment>> readSubscriptionPayments() =>
      _subscriptionController.asBroadcastStream().first;

  Future<UserFoodCount> _readUserFoodCount() => _remoteApi.readUserFoodCount();

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
}
