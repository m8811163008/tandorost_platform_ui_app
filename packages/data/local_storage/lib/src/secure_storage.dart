import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_storage/src/models/json_map.dart';

class SecureStorage{
  final FlutterSecureStorage prefs;

  SecureStorage(this.prefs);

  Future<void> upsert(String key, JsonMap value) async {
    await prefs.write(key : key,value: json.encode(value));
  }

  Future<JsonMap?> read(String key) async {
    final value =await prefs.read(key: key);
    if (value == null) {
      return null;
    }
    return json.decode(value);
  }

  Future<void> delete(String key) async {
    await prefs.delete(key:key);
  }
}