import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tb_net/storage/storage_manager.dart';
import 'package:tb_net/utils/locator.dart';

class AuthInterc extends http.BaseClient {
  FlutterSecureStorage secureStorage;

  AuthInterc({this.secureStorage});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // intercept call

    if (request.method == "POST") {
      //check the internet connectivity status

      //check the Authentication header

      /*  if (userAccessToken.toString().isNotEmpty) {
        request.headers
            .putIfAbsent('Authentication', () => userAccessToken.toString());
      } */
    }

    return request.send().timeout(Duration(seconds: 10));

    // throw UnimplementedError();
  }

  String _inMemoryToken = '';

  Future<String> get userAccessToken async {
    //use memory cached data if there
    if (_inMemoryToken.isEmpty) {
      //load from storage, set in memory cache
      _inMemoryToken = await locator.get<StorageManager>().get("token");
    }

    return _inMemoryToken;
  }

  void clear() {
    _inMemoryToken = '';
  }
}
