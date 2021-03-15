import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_net/providers/login_form.dart';
import 'package:tb_net/storage/storage_manager.dart';
import 'package:tb_net/utils/connection_status.dart';
import 'package:tb_net/utils/locator.dart';
import 'package:tb_net/utils/routers.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isOffline = false;

  @override
  void initState() {
    // TODO: implement initState
    // locator.get<ConnectionStatus>().connectionChange.listen(connectionChanged);

    super.initState();
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser =
        Provider.of<LoginFormProvider>(context, listen: false).currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $currentUser'),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(currentUser),
            ),
            ElevatedButton(
              onPressed: () async {
                String token;
                try {
                  token = await locator.get<StorageManager>().get('token');
                } catch (e) {
                  token = null;
                }

                if (token == "" || token == null) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouterPages.Login, (_) => false);
                }
              },
              child: Text('get it the token'),
            ),
            ElevatedButton(
              onPressed: () async {
                await locator.get<StorageManager>().reset("token");

                Navigator.pushNamedAndRemoveUntil(
                    context, RouterPages.Login, (_) => false);
              },
              child: Text('log off'),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: (isOffline)
                  ? new Text("Not connected")
                  : new Text("Connected"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              child: Text('home'),
              onPressed: () {},
            ),
            TextButton(
              child: Text('news'),
              onPressed: () {},
            ),
            TextButton(
              child: Text('chat'),
              onPressed: () {},
            ),
            TextButton(
              child: Text('profile'),
              onPressed: () {
                Navigator.pushNamed(context, RouterPages.Profile);
              },
            ),
          ],
        ),
      ),
    );
  }
}
