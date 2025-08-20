import 'package:remote_api/remote_api.dart';

class PaymentRepository {
  final RemoteApi _remoteApi;
  PaymentRepository({required RemoteApi remoteApi}) : _remoteApi = remoteApi;

  Future<List<SubscriptionPayment>> readSubscriptionPayments() async =>
      _remoteApi.readSubscriptionPayments();

  Future<CafeBazzarPaymentInfo> readCoffeBazzarPayment() =>
      _remoteApi.readCoffeBazzarPayment();

  Future<bool> get canRequestForFoodNutrition async {
    final subscriptions = await readSubscriptionPayments();

    return subscriptions.any((subscription) => subscription.isActive);
  }

  Future<void> createSubscriptionPayments(
    SubscriptionPayment subscriptionPayment,
  ) => _remoteApi.createSubscriptionPayments(subscriptionPayment);
}
