import 'dart:async';
import 'dart:io';

import 'package:tb_net/models/auth_resp.dart';
import 'dart:convert';

import 'package:tb_net/services/auth_interc.dart';
import 'package:tb_net/storage/storage_manager.dart';
import 'package:tb_net/utils/locator.dart';
import 'package:tb_net/utils/logs.dart';

class Auth {
  var _http = AuthInterc();

  String _host = 'http://192.168.2.40:5000/';

  String _urlRegister = 'http://192.168.2.41:5000/register';
  String _urlLogin = 'http://192.168.2.41:5000/login';
  String _urlRefresh = 'http://192.168.2.41:5000/refresh';
  String _urlLogout = 'http://192.168.2.41:5000/logout';

  var _headers = {
    'Content-Type': 'application/json',
  };

  //user register
  Future register(String phone, String email, String password) async {
    await Future.delayed(Duration(seconds: 3));
    try {
      var paramRegister = jsonEncode({
        'phone': phone,
        'email': email,
        'pwd': password,
      });

      final response = await _http.post(_urlRegister,
          headers: _headers, body: paramRegister);
      // .timeout(const Duration(seconds: 30));

      var retVal = jsonDecode(response.body);
      if (retVal["status"] == 200) {
        await locator
            .get<StorageManager>()
            .caching(Authresp.fromJson(retVal["data"][0]), "token");
      }

      return retVal;
    } on TimeoutException catch (e) {
      Logs.p.e(e);
      return {'status': 400, 'err': 'Unstable network'};
    } on SocketException catch (e) {
      Logs.p.e(e);
      return {'status': 400, 'err': e.message};
    } catch (e) {
      Logs.p.e(e);
      return {'status': 400, 'err': e.message};
    }
  }

  //user login
  Future login(String phone, String password) async {
    // await Future.delayed(Duration(seconds: 3));

    try {
      var paramRegister = jsonEncode({
        "phone": phone,
        "pwd": password,
      });

      final response =
          await _http.post(_urlLogin, headers: _headers, body: paramRegister);
      //  .timeout(const Duration(seconds: 3));

      var retVal = jsonDecode(response.body);
      if (retVal["status"] == 200) {
        await locator
            .get<StorageManager>()
            .caching(Authresp.fromJson(retVal["data"][0]), "token");
      }

      return retVal;
    } on TimeoutException catch (e) {
      Logs.p.e(e);
      return {'status': 400, 'err': 'Unstable network'};
    } on SocketException catch (e) {
      Logs.p.e(e);
      return {'status': 400, 'err': e.message};
    } catch (e) {
      Logs.p.e(e);
      return {'status': 400, 'err': e.message};
    }
  }

  //refresh token
  Future refreshToken(String token) async {
    try {
      var headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
      final response = await _http.post(_urlRefresh, headers: headers);
      //  .timeout(const Duration(seconds: 3));

      var retVal = jsonDecode(response.body);
      if (retVal["status"] == 200) {
        final authresp = Authresp(
            token: retVal["data"][0]["token"],
            refresh: token,
            ext: retVal["data"][0]["ext"]);
        await locator.get<StorageManager>().caching(authresp, "token");
      }
      return retVal;
    } on TimeoutException catch (e) {
      Logs.p.e(e);
      return {'status': 400, 'err': 'Unstable network'};
    } on SocketException catch (e) {
      Logs.p.e(e);
      return {'status': 400, 'err': e.message};
    } catch (e) {
      Logs.p.e(e);
      return {'status': 400, 'err': e.message};
    }
  }

  //logout
  Future logout(String token) async {
    try {
      var headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
      final response = await _http.post(_urlLogout, headers: headers);
      //  .timeout(const Duration(seconds: 3));

      var retVal = jsonDecode(response.body);

      return retVal;
    } on TimeoutException catch (e) {
      Logs.p.e(e);
      return {'status': 400, 'err': 'Unstable network'};
    } on SocketException catch (e) {
      Logs.p.e(e);
      return {'status': 400, 'err': e.message};
    } catch (e) {
      Logs.p.e(e);
      return {'status': 400, 'err': e.message};
    }
  }
}
