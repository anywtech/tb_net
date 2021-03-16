import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  final phoneControl = TextEditingController();
  final emailControl = TextEditingController();
  final passwordTextControl = TextEditingController();

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  IconData _suffixIcon = Icons.visibility_off;
  IconData get suffixIcon => _suffixIcon;

  bool _isNewUser = false;
  bool get isNewUser => _isNewUser;

  String _nameOfLoginBtn = "Sign In";
  String get nameOfLoginBtn => _nameOfLoginBtn;

  String _msgOfFlatBtn = "Not have a count yet?";
  String get msgOfFlatBtn => _msgOfFlatBtn;

  String _nameOfFlatBtn = "Sign Up";
  String get nameOfFlatBtn => _nameOfFlatBtn;

  bool _isVerified = true;
  bool get isVerified => _isVerified;

  String _currentUser = "";
  String get currentUser => _currentUser;

  void setUser(String u) {
    _currentUser = u;
    notifyListeners();
  }

  //change the enablement of the button according to the input value
  enableButton() {
    if (_isNewUser) {
      if (phoneControl.text.indexOf('123') >= 0 &&
          emailControl.text.indexOf('@') >= 0 &&
          passwordTextControl.text.trim().length >= 8) {
        _isVerified = true;
      } else {
        _isVerified = false;
      }
    } else {
      _isVerified = true;
    }
    notifyListeners();
  }

  initTextControls() {
    _isVerified = true;
    _isObscure = true;
    _suffixIcon = _isObscure ? Icons.visibility : Icons.visibility_off;
    phoneControl.clear();
    emailControl.clear();
    passwordTextControl.clear();
  }

  @override
  void dispose() {
    phoneControl.dispose();
    emailControl.dispose();
    passwordTextControl.dispose();
    _currentUser = "";
    super.dispose();
  }

  setObscure() {
    _isObscure = !_isObscure;
    _suffixIcon = _isObscure ? Icons.visibility : Icons.visibility_off;
    notifyListeners();
  }

  signInorsignUp() {
    initTextControls();
    _isNewUser = !_isNewUser;
    if (isNewUser) {
      _isVerified = false;
      _nameOfLoginBtn = "Sign Up";
      _msgOfFlatBtn = "Already have an account?";
      _nameOfFlatBtn = "Sign In";
    } else {
      _isVerified = true;
      _nameOfLoginBtn = "Sign In";
      _msgOfFlatBtn = "Not have an account?";
      _nameOfFlatBtn = "Sign Up";
    }

    notifyListeners();
  }
}
