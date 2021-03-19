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

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<Locale> initialSystemLocales =
      WidgetsBinding.instance.window.locales;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profle'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Consumer<HomeProvider>(
            builder: (__, baseinfo, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    height: MediaQuery.of(context).size.width - 220,
                    width: MediaQuery.of(context).size.width - 220,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image:
                            NetworkImage('https://i.stack.imgur.com/Hire2.png'),
                        //fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                      Provider.of<LoginFormProvider>(context, listen: false)
                          .currentUser),
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
                Text('app selected lang is : ${baseinfo.locale.languageCode})'),
                Text(
                    'app selected country code  is : ${baseinfo.locale.countryCode}'),
                SizedBox(
                  height: 50.0,
                ),
                for (var locale in initialSystemLocales)
                  Text(locale.toString()),
                SizedBox(
                  height: 50.0,
                ),
                LocalePicker(iconData: Icons.work_outlined, T: baseinfo),
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
    );
  }
}
