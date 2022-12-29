import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageInterface {
  Future<String?> read(String key, AndroidOptions? androidOptions, IOSOptions? iosOptions);
  Future<void> write(String key, String value, AndroidOptions? androidOptions, IOSOptions? iosOptions);
  Future<void> deleteAll(AndroidOptions? androidOptions, IOSOptions? iosOptions);
}
