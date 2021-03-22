import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_net/providers/register_form.dart';
import 'package:tb_net/utils/common_value.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/input_text.dart';

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterFormProvider>(builder: (__, reg, _) {
      return Container(
        width: double.infinity,
        child: Column(
          children: [
            //phone number
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: InputText(
                controller: reg.phoneControl,
                onChanged: (s) => reg.validation(s),
                labeltext: CommonValue.lableTextOfPhone,
                prefixIcon: Icons.person,
                keyboardType: TextInputType.phone,
              ),
            ),

            //email
            InputText(
              controller: reg.emailControl,
              onChanged: (s) => reg.validation(s),
              labeltext: CommonValue.lableTextOfEmail,
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),

            //password
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: InputText(
                controller: reg.passwordControl,
                onChanged: (s) => reg.validation(s),
                labeltext: CommonValue.lableTextOfPassword,
                isObscure: reg.isObscure,
                prefixIcon: Icons.lock,
                suffixIcon: reg.suffixIcon,
                suffixIconEvent: () => reg.setObscure(),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 15.0),
              width: double.infinity,
              color: reg.isValid ? Colors.orange : Colors.orange[100],
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: reg.isValid ? Colors.orange : Colors.orange[100]),
                child: Text(
                  CommonValue.SingUp,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () => reg.isValid ? reg.submit(context) : null,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(CommonValue.DescSignIn),
                TextButton(
                    child: Text(
                      CommonValue.SingIn,
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () {
                      reg.initTextControls();
                      Navigator.of(context).popAndPushNamed(RouterPages.Login);
                    }),
              ],
            ),
          ],
        ),
      );
    });
  }
}
