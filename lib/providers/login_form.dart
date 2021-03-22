import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tb_net/services/auth.dart';
import 'package:tb_net/utils/processing_dialogue.dart';
import 'package:tb_net/utils/routers.dart';

class LoginFormProvider extends ChangeNotifier {
  final phoneControl = TextEditingController();
  final passwordControl = TextEditingController();

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  IconData _suffixIcon = Icons.visibility;
  IconData get suffixIcon => _suffixIcon;

  String _currentUser = "";
  String get currentUser => _currentUser;

  void setUser(String u) {
    _currentUser = u;
    notifyListeners();
  }

  initTextControls() {
    _isObscure = true;
    _suffixIcon = _isObscure ? Icons.visibility : Icons.visibility_off;
    phoneControl.clear();
    //  emailControl.clear();
    passwordControl.clear();
  }

  @override
  void dispose() {
    phoneControl.dispose();
    passwordControl.dispose();
    _currentUser = "";
    super.dispose();
  }

  setObscure() {
    _isObscure = !_isObscure;
    _suffixIcon = _isObscure ? Icons.visibility : Icons.visibility_off;
    notifyListeners();
  }

  forgetPassword() {}

  submit(BuildContext context) async {
    try {
      if (phoneControl.text == "" || passwordControl.text == "") {
        return;
      }

      Auth _auth = Auth();
      ProcessingDialogue.show(context);
      var response = await _auth.login(
          phoneControl.text.trim(), passwordControl.text.trim());

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
