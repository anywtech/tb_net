import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tb_net/services/auth.dart';
import 'package:tb_net/services/udc_invitation.dart';
import 'package:tb_net/storage/storage_manager.dart';
import 'package:tb_net/utils/locator.dart';
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
    _currentUser = "";
    super.dispose();
  }

  setObscure() {
    _isObscure = !_isObscure;
    _suffixIcon = _isObscure ? Icons.visibility : Icons.visibility_off;
    notifyListeners();
  }

  initValue() {
    phoneControl.clear();
    passwordControl.clear();
    _currentUser = "";
    //_linkPath = null;
    //notifyListeners();
  }

  setRedirectLink(BuildContext context, String from) {
    var linkpath = locator.get<UdcInvitation>().linkPath;
    if (from == RouterPages.Home) {
      if (linkpath != null && linkpath["path"] != RouterPages.Register) {
        // ProcessingDialogue.show(context);
        Future.delayed(Duration(milliseconds: 50), () {
          if (Navigator.canPop(context)) {
            Navigator.of(context).pop();
          }
          Navigator.of(context)
              .pushNamed(linkpath["path"], arguments: linkpath["code"]);
        });
      }
    }
    if (from == RouterPages.Login) {
      if (linkpath != null && linkpath["path"] == RouterPages.Register) {
        Future.delayed(Duration(milliseconds: 20), () {
          Navigator.of(context)
              .popAndPushNamed(linkpath["path"], arguments: linkpath["code"]);
        });
      }
    }
  }

  forgetPassword() {}

  signOff(BuildContext context) async {
    initValue();
    setUser("");
    await locator.get<StorageManager>().reset("token");
    locator.get<UdcInvitation>().dispose();
    Navigator.pushNamedAndRemoveUntil(
        context, RouterPages.Dispatcher, (_) => false);
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  Future<String> onResume() async {
    var login = await locator.get<StorageManager>().get("token");
    if (login == null || login == "") {
      setUser("");
    } else {
      setUser("tempuser");
    }

    return login;
  }

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
