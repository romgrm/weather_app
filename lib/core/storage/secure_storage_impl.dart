import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weather_app/core/storage/secure_storage.dart';

class SecureStorageImpl implements SecureStorageInterface {
  final FlutterSecureStorage storage;

  SecureStorageImpl(this.storage);

  @override
  Future<String?> read(String key, AndroidOptions? androidOptions, IOSOptions? iosOptions) async {
    final result = await storage.read(key: key, aOptions: androidOptions, iOptions: iosOptions);
    return result;
  }

  @override
  Future<void> write(String key, String value, AndroidOptions? androidOptions, IOSOptions? iosOptions) async {
    await storage.write(key: key, value: value, aOptions: androidOptions, iOptions: iosOptions);
  }

  @override
  Future<void> deleteAll(AndroidOptions? androidOptions, IOSOptions? iosOptions) async {
    await storage.deleteAll(aOptions: androidOptions, iOptions: iosOptions);
  }
}
