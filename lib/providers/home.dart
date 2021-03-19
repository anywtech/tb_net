import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tb_net/generated/l10n.dart';
import 'package:tb_net/storage/storage_manager.dart';
import 'package:tb_net/utils/locator.dart';

class HomeProvider extends ChangeNotifier {
  String _timePoint = "";
  String get timePoint => _timePoint;

  Timer _timer;

  void timerRunner() {
    var _period = const Duration(seconds: 1);

    _timer = Timer.periodic(_period, (timer) {
      DateTime now = DateTime.now();
      _timePoint = DateFormat('kk:mm:ss:ms \n EEE d MMM').format(now);

      notifyListeners();
    });
  }

  void cancelRunner() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  Locale _locale = Locale('en', 'US');
  Locale get locale => _locale ?? Locale('en', 'US');

  //check from preferences
  getLocale() async {
    var lang = await locator.get<StorageManager>().getValPair("lang");
    if (lang != null) {
      _locale = Locale(lang["code"], lang["countryCode"]);
      notifyListeners();
    }
  }

  void setLocale(Locale l) async {
    _locale = l;
    S.load(l);
    var data = {"code": l.languageCode, "countryCode": l.countryCode};
    await locator.get<StorageManager>().setValPair("lang", data);
    notifyListeners();
  }

  List<Locale> _listLocale = S.delegate.supportedLocales;
  List<Locale> get listLocale => _listLocale;
}
