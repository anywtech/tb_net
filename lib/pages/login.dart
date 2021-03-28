import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_net/providers/login_form.dart';
import 'package:tb_net/services/udc_invitation.dart';
import 'package:tb_net/utils/global_pref.dart';
import 'package:tb_net/utils/locator.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/login_form.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

/*   @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    if (state == AppLifecycleState.resumed) {
      Provider.of<LoginFormProvider>(context, listen: false)
          .setRedirectLink(context, RouterPages.Login);
    }
  } */

  @override
  Widget build(BuildContext context) {
    GlobalPref pref = GlobalPref.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //width: double.infinity,
            decoration: new BoxDecoration(
              color: Colors.orange,
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topCenter,
                colors: [
                  Colors.orange[50],
                  Colors.orange[50],
                  Colors.orange[50],
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.orange[50],
                  Colors.orange[50],
                  Colors.orange[50],
                  Colors.orange[100],
                ],
              ),
            ),
            height: pref.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: pref.ph(8.0),
                  left: 15,
                  right: 15,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'ALIZII',
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: pref.ph(20),
                  left: 15,
                  right: 15,
                  child: LoginForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
