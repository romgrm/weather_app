import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weather_app/core/storage/secure_storage.dart';
import 'package:weather_app/dataLayer/dto/user.dto.dart';
import 'package:weather_app/domainLayer/user.entity.dart';

/*
 * On-device storage (cache) manager.
 */
class StorageManager {
  static const currentUserKey = 'currentUser';
  static const otherUsersKey = 'otherUsers';
  static const languageKey = 'language';
  static const appPausedTimeKey = 'appPausedTime';

  final SecureStorageInterface _storage;
  final _iosOptions = const IOSOptions(
    accessibility: IOSAccessibility.unlocked_this_device,
  );

  StorageManager(this._storage);

  /*
   * Makes sure the cache is cleared when the app is reinstalled and prevents previously cached data to reappear.
   * https://stackoverflow.com/a/57937650
   */
  // Future<void> deleteAllOnFirstRun() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if (prefs.getBool('first_run') ?? true) {
  //     await _storage.deleteAll(_androidOptions, _iosOptions);
  //     // await _storage.deleteAll(aOptions: _androidOptions, iOptions: _iosOptions);
  //   }
  //   prefs.setBool('first_run', false);
  // }

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
