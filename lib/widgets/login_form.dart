import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_net/providers/login_form.dart';
import 'package:tb_net/utils/common_value.dart';
import 'package:tb_net/utils/global_pref.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/input_text.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _globleSetting = GlobalPref.of(context);
    return Consumer<LoginFormProvider>(builder: (__, login, _) {
      return Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //phone number
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: InputText(
                controller: login.phoneControl,
                labeltext: CommonValue.lableTextOfPhone,
                prefixIcon: Icons.person,
                keyboardType: TextInputType.phone,
              ),
            ),

            //password
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: InputText(
                controller: login.passwordControl,
                labeltext: CommonValue.lableTextOfPassword,
                isObscure: login.isObscure,
                prefixIcon: Icons.lock,
                suffixIcon: login.suffixIcon,
                suffixIconEvent: () => login.setObscure(),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => login.forgetPassword(),
                child: Text(
                  CommonValue.ForgetPassword,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 15.0),
              color: Colors.orange,
              child: TextButton(
                child: Text(
                  CommonValue.SingIn,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () => login.submit(context),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(CommonValue.DescSignUp),
                TextButton(
                    child: Text(
                      CommonValue.SingUp,
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () {
                      login.initTextControls();
                      Navigator.popAndPushNamed(context, RouterPages.Register);
                    }),
              ],
            ),

            Container(
              padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
              child: Text(CommonValue.DescSocialLogin),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: CommonValue.SocialLogin.map(
                  (s) => CircleAvatar(
                    minRadius: _globleSetting.pw(5.0),
                    maxRadius: _globleSetting.pw(7.0),
                    backgroundColor: Colors.orange,
                  ),
                ).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
