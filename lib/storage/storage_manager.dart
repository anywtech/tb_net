import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tb_net/models/auth_resp.dart';
import 'package:tb_net/models/cache.dart';
import 'package:tb_net/services/auth.dart';
import 'package:tb_net/utils/locator.dart';

class StorageManager {
  final FlutterSecureStorage _secureStorage;

  StorageManager(this._secureStorage);

  //get prefs
  Future<String> getVal(String key) async {
    try {
      final data = await _secureStorage.read(key: key);
      return data;
    } on Exception catch (e) {
      // TODO
      return null;
    }
  }

  // wirite prefs
  Future<void> setVal(String key, String data) async {
    try {
      await _secureStorage.write(key: key, value: data);
    } on Exception catch (e) {
      // TODO
    }
  }

  // wirite tokens
  Future<void> caching(Authresp authresp, String key) async {
    try {
      final Cache cache = Cache(
          token: authresp.token,
          refresh: authresp.refresh,
          ext: authresp.ext,
          createAt: DateTime.now());

      final data = jsonEncode(cache.toJson());

      await _secureStorage.write(key: key, value: data);
    } on Exception catch (e) {
      // TODO

    }
  }

  //get token
  Future<String> get(String key) async {
    try {
      final data = await _secureStorage.read(key: key);

      if (data != null) {
        final cache = Cache.fromJson(jsonDecode(data));

        final DateTime current = DateTime.now();
        final DateTime createAt = cache.createAt;
        final int ext = cache.ext;
        final int diff = current.difference(createAt).inSeconds;

        if (ext - diff > 60) {
          return cache.token;
        } else {
          var response = await locator.get<Auth>().refreshToken(cache.refresh);
          if (response["status"] == 200) {
            return cache.token;
          }
        }
        return null;
      }
      return null;
    } on Exception catch (e) {
      // TODO
      return null;
    }
  }

  //clear by key
  Future<void> reset(String key) async {
    try {
      if (key == "token") {
        final data = await _secureStorage.read(key: key);
        if (data != null) {
          final cache = Cache.fromJson(jsonDecode(data));
          await locator.get<Auth>().logout(cache.token);
        }
      }
      await _secureStorage.delete(key: key);
    } on Exception catch (e) {
      // TODO
    }
  }
}
