import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _secureStorage = const FlutterSecureStorage();
  Future<void> saveAccessToken(String token) async {
    await _secureStorage.write(key: 'accessToken', value: token);
  }

  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: 'accessToken');
  }

  Future<void> removeAccessToken() async {
    return await _secureStorage.delete(key: 'accessToken');
  }

  Future<void> save(String value) async {
    await _secureStorage.write(key: 'onBoardDone', value: value);
  }

  Future<String?> getValue(String key) async {
    return await _secureStorage.read(key: key);
  }
}
