import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_net/providers/home.dart';
import 'package:tb_net/providers/login_form.dart';
import 'package:tb_net/storage/storage_manager.dart';
import 'package:tb_net/utils/locator.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/home/locale_picker.dart';
import 'package:tb_net/widgets/home/time_shower.dart';
import 'package:tb_net/widgets/home/timer_stream.dart';

import 'package:tb_net/generated/l10n.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentUser;

  final List<Locale> initialSystemLocales =
      WidgetsBinding.instance.window.locales;

  @override
  void initState() {
    currentUser =
        Provider.of<LoginFormProvider>(context, listen: false).currentUser;
    Provider.of<HomeProvider>(context, listen: false).getLocale();
    super.initState();
  }

  @override
  void dispose() {
    currentUser = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $currentUser'),
        actions: [
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
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Consumer<HomeProvider>(
            builder: (__, locale, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(currentUser),
                ),
                TimeShower(),
                SizedBox(
                  height: 50.0,
                ),
                TimerStream(),
                SizedBox(
                  height: 50.0,
                ),
                Text('system default lang is : ${Platform.localeName}'),
                Text(
                    'system default county code is ${Platform.localeName.split('_')[1]}'),
                SizedBox(
                  height: 50.0,
                ),
                Text('app selected lang is : ${locale.locale.languageCode})'),
                Text(
                    'app selected country code  is : ${locale.locale.countryCode}'),
                SizedBox(
                  height: 50.0,
                ),
                for (var locale in initialSystemLocales)
                  Text(locale.toString()),
                SizedBox(
                  height: 50.0,
                ),
                LocalePicker(iconData: Icons.work_outlined, T: locale),
                SizedBox(
                  height: 50.0,
                ),
                Text(S.of(context).pageHomeListTitle,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                Text(S.of(context).pageHomeSamplePlaceholder("John"),
                    style: TextStyle(fontSize: 20)),
                Text(
                    S
                        .of(context)
                        .pageHomeSamplePlaceholdersOrdered("John", "Doe"),
                    style: TextStyle(fontSize: 20)),
                Text(S.of(context).pageHomeSamplePlural(2),
                    style: TextStyle(fontSize: 20)),
                SizedBox(
                  height: 200.0,
                ),
              ],
            ),
          ),
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
