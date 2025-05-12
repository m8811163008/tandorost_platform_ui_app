import 'package:local_storage/src/models/json_map.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NonSecureStorage {
  final SharedPreferences prefs;

  NonSecureStorage(this.prefs);

  Future<void> upsert(String key, JsonMap value) async {
    await prefs.setString(key, json.encode(value));
  }

  JsonMap? read(String key) {
    final value = prefs.getString(key);
    if (value == null) {
      return null;
    }
    return json.decode(value);
  }

  Future<void> delete(String key) async {
    await prefs.remove(key);
  }
}
