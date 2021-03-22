import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tb_net/services/auth.dart';
import 'package:tb_net/utils/processing_dialogue.dart';
import 'package:tb_net/utils/routers.dart';

class RegisterFormProvider extends ChangeNotifier {
  final phoneControl = TextEditingController();
  final emailControl = TextEditingController();
  final passwordControl = TextEditingController();
  final invitationControl = TextEditingController();

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  IconData _suffixIcon = Icons.visibility;
  IconData get suffixIcon => _suffixIcon;

  String _currentUser = "";
  String get currentUser => _currentUser;

  bool _isValid = false;
  bool get isValid => _isValid;

  void setUser(String u) {
    _currentUser = u;
    notifyListeners();
  }

  void validation(String s) {
    if (s.indexOf('123') >= 0) {
      _isValid = true;
    } else {
      _isValid = false;
    }
    notifyListeners();
  }

  initTextControls() {
    _isValid = false;
    _isObscure = true;
    _suffixIcon = _isObscure ? Icons.visibility : Icons.visibility_off;
    phoneControl.clear();
    emailControl.clear();
    passwordControl.clear();
    invitationControl.clear();
  }

  @override
  void dispose() {
    phoneControl.dispose();
    emailControl.dispose();
    passwordControl.dispose();
    invitationControl.dispose();
    _currentUser = "";
    super.dispose();
  }

  setObscure() {
    _isObscure = !_isObscure;
    _suffixIcon = _isObscure ? Icons.visibility : Icons.visibility_off;
    notifyListeners();
  }

  submit(BuildContext context) async {
    try {
      if (!_isValid) {
        return;
      }

      Auth _auth = Auth();
      ProcessingDialogue.show(context);
      var response = await _auth.register(phoneControl.text.trim(),
          emailControl.text.trim(), passwordControl.text.trim());

      ProcessingDialogue.dismiss(context);
      if (response['status'] == 200) {
        setUser(phoneControl.text.trim());
        initTextControls();
        Navigator.pushNamedAndRemoveUntil(
            context, RouterPages.Home, (_) => false);
      } else {
        setUser("");
        ProcessingDialogue.toastcontent(context, response['err']);
      }
    } catch (e) {
      setUser("");
      ProcessingDialogue.dismiss(context);
      ProcessingDialogue.toastcontent(context, 'Connectivity issue');
    }
  }
}
