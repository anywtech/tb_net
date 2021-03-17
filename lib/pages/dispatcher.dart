import 'package:flutter/material.dart';
import 'package:tb_net/pages/home.dart';
import 'package:tb_net/pages/login.dart';
import 'package:tb_net/storage/storage_manager.dart';
import 'package:tb_net/utils/locator.dart';

class Dispatcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        //besoin de ajouter la validation de token
        future: locator.get<StorageManager>().get("token"), // async work
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Scaffold(body: CircularProgressIndicator());
            default:
              if (snapshot.hasError)
                return Login(); //Text('Error: ${snapshot.error}');
              else
                return snapshot.data != "" && snapshot.data != null
                    ? Home()
                    : Login();
          }
        },
      ),
    );
  }
}
