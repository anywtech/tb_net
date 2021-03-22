import 'package:flutter/material.dart';
import 'package:tb_net/utils/global_pref.dart';
import 'package:tb_net/widgets/register_form.dart';

class Register extends StatelessWidget {
  final String invitedBy;
  const Register({Key key, this.invitedBy}) : super(key: key);
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
            height: GlobalPref.of(context).height,
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
                  child: RegisterForm(
                    invitedBy: invitedBy,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
