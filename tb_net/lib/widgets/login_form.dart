import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_net/providers/login_form.dart';
import 'package:tb_net/services/auth.dart';
import 'package:tb_net/utils/global_pref.dart';
import 'package:tb_net/utils/processing_dialogue.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //GlobalKey<FormState> _formKey = GlobalKey();

  var socialLogin = [
    {"name": "FaceBook", "icon": "icon1"},
    {"name": "FaceBook", "icon": "icon1"},
    {"name": "FaceBook", "icon": "icon1"},
  ];

  _forgetPassword() {}

  @override
  Widget build(BuildContext context) {
    GlobalPref _globalPref = GlobalPref.of(context);
    Auth _auth = Auth();
    LoginFormProvider _login = context.read<LoginFormProvider>();

    _changeObscure() {
      _login.setObscure();
    }

    _signInorSignUp() {
      //_formKey.currentState.reset();
      _login.signInorsignUp();
    }

    _submit() async {
      // final isVerified = _formKey.currentState.validate();

      if (!_login.isVerified) {
        return;
      }

      try {
        ProcessingDialogue.show(context);
        var response;
        if (_login.isVerified) {
          // new user to register or existed user login
          if (!_login.isNewUser) {
            response = await _auth.login(_login.phoneControl.text.trim(),
                _login.passwordTextControl.text.trim());

            // print(response);
          } else {
            response = await _auth.register(
                _login.phoneControl.text.trim(),
                _login.emailControl.text.trim(),
                _login.passwordTextControl.text.trim());
            // print(response);
          }
        }

        ProcessingDialogue.dismiss(context);
        if (response['status'] == 200) {
          _login.setUser(_login.phoneControl.text.trim());
          _login.initTextControls();
          Navigator.pushNamedAndRemoveUntil(
              context, RouterPages.Home, (_) => false);
        } else {
          _login.setUser("");
          ProcessingDialogue.toastcontent(context, response['err']);
        }
      } catch (e) {
        _login.setUser("");
        ProcessingDialogue.dismiss(context);
        ProcessingDialogue.toastcontent(context, 'Connectivity issue');
      }
    }

    return Container(
      child: Consumer<LoginFormProvider>(builder: (__, l, _) {
        return Column(
          children: [
            //phone number
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: InputText(
                controller: l.phoneControl,
                onChanged: (String s) {
                  l.enableButton();
                },
                validator: (String s) {
                  if (s.trim().indexOf('123') >= 0) {
                    return "Invalid Input";
                  }
                  return null;
                },
                labeltext: "Phone Number",
                prefixIcon: Icons.person,
                keyboardType: TextInputType.phone,
              ),
            ),

            //email
            !(l.isNewUser)
                ? Container()
                : InputText(
                    controller: l.emailControl,
                    onChanged: (String s) {
                      l.enableButton();
                    },
                    validator: (String s) {
                      if (s.trim().indexOf('@') >= 0) {
                        return "Invalid Input";
                      }
                      return null;
                    },
                    labeltext: "Email",
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),

            //password
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: InputText(
                controller: l.passwordTextControl,
                onChanged: (String s) {
                  l.enableButton();
                },
                validator: (String s) {
                  if (s.trim().length < 8) {
                    return "password no less than 8";
                  }
                  return null;
                },
                labeltext: "Password",
                isObscure: l.isObscure,
                prefixIcon: Icons.lock,
                suffixIcon: l.suffixIcon,
                suffixIconEvent: _changeObscure,
              ),
            ),
            l.isNewUser
                ? Container()
                : Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      splashColor: Colors.orange[200],
                      onPressed: _forgetPassword,
                      child: Text(
                        'Forget Password',
                        style: TextStyle(
                          fontSize: _globalPref.pw(3),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

            Container(
              margin: l.isNewUser
                  ? EdgeInsets.only(top: 30.0)
                  : EdgeInsets.only(top: 15.0),
              width: _globalPref.pw(100.0),
              color: l.isVerified ? Colors.orange : Colors.orange[100],
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text(
                  l.nameOfLoginBtn,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: _submit,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l.msgOfFlatBtn),
                FlatButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.0,
                  ),
                  child: Text(
                    l.nameOfFlatBtn,
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  onPressed: _signInorSignUp,
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
              child: Text('- I want to Sign In With -'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: socialLogin
                    .map(
                      (s) => CircleAvatar(
                        minRadius: _globalPref.pw(5.0),
                        maxRadius: _globalPref.pw(7.0),
                        backgroundColor: Colors.orange,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      }),
    );
  }
}
