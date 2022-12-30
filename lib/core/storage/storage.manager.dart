import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weather_app/core/storage/secure_storage.dart';
import 'package:weather_app/domainLayer/user.entity.dart';

class StorageManager {
  static const currentUserKey = 'currentUser';

  final SecureStorageInterface _storage;
  final _iosOptions = const IOSOptions(
    accessibility: IOSAccessibility.unlocked_this_device,
  );

  StorageManager(this._storage);

  Future<UserEntity?> readCurrentUser() async {
    String? current = await _storage.read(currentUserKey, null, _iosOptions);

    if (current != null) {
      Map<String, dynamic> json = jsonDecode(current);
      return UserEntity.fromJson(json);
    }
    return null;
  }

  Future<void> writeCurrentUser(UserEntity user) async {
    String json = jsonEncode(user);
    if (json.isNotEmpty) {
      await _storage.write(currentUserKey, json, null, _iosOptions);
    }
  }

  Future<void> deleteCurrentUser() async {
    await _storage.deleteAll(null, null);
  }
}
