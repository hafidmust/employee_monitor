import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  read(String key) async {
    return await _storage.read(key: key);
  }

  write(String key, String value) async {
    return await _storage.write(key: key, value: value);
  }
}