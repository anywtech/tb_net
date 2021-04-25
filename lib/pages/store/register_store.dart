import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/common/custom_button.dart';
import 'package:tb_net/widgets/input_text.dart';

class RegisterStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouterPages.RegisterStore),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'Store Information',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                color: Colors.white,
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * .25,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Icon(
                      Icons.add_a_photo_outlined,
                      size: 60.0,
                      color: Colors.grey[200],
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Hold personal ID or business license',
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              InputText(
                labeltext: 'Store Name',
                contentPaddingVertical: 10.0,
              ),
              const SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Store Type'),
                      Icon(
                        Icons.chevron_right_outlined,
                        color: Colors.grey[400],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Store Address'),
                      Icon(
                        Icons.chevron_right_outlined,
                        color: Colors.grey[400],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 30.0,
              ),
              Container(
                child: Text(
                  'Contact Information',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              InputText(
                labeltext: 'Name',
                contentPaddingVertical: 10.0,
              ),
              const SizedBox(
                height: 15.0,
              ),
              InputText(
                labeltext: 'Social Security Number',
                contentPaddingVertical: 10.0,
              ),
              const SizedBox(
                height: 15.0,
              ),
              InputText(
                labeltext: 'Mobile Phone',
                contentPaddingVertical: 10.0,
              ),
              /*  CheckboxListTile(
                value: false,
                onChanged: (v) {},
                title: RichText(
                  text: TextSpan(
                      text: 'I understand and agree ',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 10.0,
                      ),
                      children: [
                        TextSpan(
                          text: 'ALIZII General Terms and Conditions',
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 10.0,
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 10.0,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: 'Privacy Policy.',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 10.0,
                          ),
                        ),
                      ]),
                ),
              ),
             */
              ListTile(
                title: RichText(
                  text: TextSpan(
                      text: 'I understand and agree ',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 10.0,
                      ),
                      children: [
                        TextSpan(
                          text: 'ALIZII General Terms and Conditions',
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 10.0,
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 10.0,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: 'Privacy Policy.',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 10.0,
                          ),
                        ),
                      ]),
                ),
                trailing: Icon(Icons.check_box_outline_blank),
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomBottomFixedButton(
                text: 'APLLY',
                onTap: () {
                  Navigator.of(context)
                      .popAndPushNamed(RouterPages.StoreRegConfirm);
                },
              ),
              const SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
