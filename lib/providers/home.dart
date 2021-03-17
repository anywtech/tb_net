import 'dart:async';

import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  String _timePoint = "";
  String get timePoint => _timePoint;

  Timer _timer;

  void timerRunner() {
    var _period = const Duration(seconds: 1);

    _timer = Timer.periodic(_period, (timer) {
      DateTime now = DateTime.now();
      // _timePoint = DateFormat('kk:mm:ss:ms \n EEE d MMM').format(now);
      _timePoint = "";
      notifyListeners();
    });
  }

  void cancelRunner() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }
}
