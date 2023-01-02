import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'secure_storage.dart';

class SecureStorageImpl implements SecureStorageInterface {
  final FlutterSecureStorage storage;

  SecureStorageImpl(this.storage);

  @override
  Future<String?> read(String key) async {
    final result = await storage.read(key: key);
    return result;
  }

  @override
  Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  @override
  Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}
