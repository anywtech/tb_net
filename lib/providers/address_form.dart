import 'package:flutter/foundation.dart';

class AddressFormProvider extends ChangeNotifier {
  bool _checkAsDefault = false;
  bool get checkAsDefault => _checkAsDefault;

  void reverseDefault() {
    _checkAsDefault = !_checkAsDefault;
    notifyListeners();
  }
}
