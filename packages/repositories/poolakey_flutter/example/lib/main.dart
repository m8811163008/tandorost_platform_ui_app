import 'package:poolakey_flutter/poolakey_flutter.dart';

Future<void> connectToBazaar(String rsaPublicKey) async {
  try {
    await PoolakeyFlutter.connect(rsaPublicKey);
    print("Connected to Bazaar successfully.");
  } catch (e) {
    print("Failed to connect: $e");
  }
}

Future<void> buyProduct(String productId) async {
  try {
    final purchaseInfo = await PoolakeyFlutter.purchaseProduct(productId);
    print("Purchase successful: $purchaseInfo");
  } catch (e) {
    print("Purchase failed: $e");
  }
}
