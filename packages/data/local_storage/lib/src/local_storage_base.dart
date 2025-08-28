import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_storage/src/models/json_map.dart';
import 'package:local_storage/src/non_secure_storag.dart';
import 'package:local_storage/src/secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final NonSecureStorage nonSecureStorage;
  final SecureStorage secureStorage;
  LocalStorage({
    required SharedPreferences sharedPreferences,
    required FlutterSecureStorage flutterSecureStorage,
  }) : nonSecureStorage = NonSecureStorage(sharedPreferences),
       secureStorage = SecureStorage(flutterSecureStorage);

  Future<void> upsert(
    String key,
    JsonMap value, [
    bool isSecure = false,
  ]) async {
    isSecure
        ? await secureStorage.upsert(key, value)
        : await nonSecureStorage.upsert(key, value);
  }

  Future<JsonMap?> read(String key) async {
    final value = nonSecureStorage.read(key);
    if (value != null) {
      return value;
    }
    return await secureStorage.read(key);
  }

  Future<void> delete(String key) =>
      Future.wait([nonSecureStorage.delete(key), secureStorage.delete(key)]);
}

// secure storage
// crud input key , Map output Map
// normal storage
// crud input key , Map output Map
