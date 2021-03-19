import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tb_net/generated/l10n.dart';

class LocalPickerProvider extends ChangeNotifier {
  Locale _locale;
  Locale get locale => _locale;

  void setLocale(Locale l) {
    _locale = l;
    S.load(l);
    notifyListeners();
  }

  List<Locale> _listLocale = S.delegate.supportedLocales;
  List<Locale> get listLocale => _listLocale;

  String _flg;
  getFlg(String code) {
    switch (code) {
      case 'ar':
        _flg = '🇦🇪';
        break;
      case 'zh':
        _flg = '🇨🇳';
        break;
      case 'es':
        _flg = '🇪🇸';
        break;
      case 'de':
        _flg = '🇩🇪';
        break;
      case 'en':
      default:
        _flg = '🇺🇸';
        break;
    }
    return _flg;
  }
}
