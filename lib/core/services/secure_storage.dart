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

  Future<void> setRefreshToken(String token) async {
    await _secureStorage.write(key: 'refreshToken', value: token);
  }

  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: 'refreshToken');
  }

  Future<void> removeRefreshToken() async {
    return await _secureStorage.delete(key: 'refreshToken');
  }

  Future<void> save(String value) async {
    await _secureStorage.write(key: 'onBoardDone', value: value);
  }

  Future<String?> getValue(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> saveImagePath(String imagePath) async {
    await _secureStorage.write(key: imagePath, value: imagePath);
  }

  Future<String?> getImagePath(String imagePath) async {
    return await _secureStorage.read(key: imagePath);
  }
}
