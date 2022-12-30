import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domainLayer/user.entity.dart';
import 'secure_storage.dart';

class StorageManager {
  static const currentUserKey = 'currentUser';

  final SecureStorageInterface _storage;

  StorageManager(this._storage);

  Future<void> deleteAllOnFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('first_run') ?? true) {
      await _storage.deleteAll();
    }
    prefs.setBool('first_run', false);
  }

  Future<UserEntity?> readCurrentUser() async {
    await deleteAllOnFirstRun();
    String? current = await _storage.read(currentUserKey);

    if (current != null) {
      Map<String, dynamic> json = jsonDecode(current);
      return UserEntity.fromJson(json);
    }
    return null;
  }

  Future<void> writeCurrentUser(UserEntity user) async {
    String json = jsonEncode(user);
    if (json.isNotEmpty) {
      await _storage.write(currentUserKey, json);
    }
  }

  Future<void> deleteCurrentUser() async {
    await _storage.deleteAll();
  }
}
