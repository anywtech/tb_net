import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/common/custom_button.dart';

class RegisterDriver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouterPages.RegisterDriver),
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
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(5.0)),
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
                        'Hold personal ID or driver license',
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
              CustomInputTextfiled(
                hintText: 'Name',
                widget: Icon(Icons.person),
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomInputTextfiled(
                hintText: 'SSN or ID',
                widget: Icon(Icons.crop_landscape_rounded),
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomInputTextfiled(
                hintText: 'Insurance Number',
                widget: Icon(Icons.my_library_books),
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomInputTextfiled(
                hintText: 'Prefered Area',
                widget: Icon(Icons.location_on_outlined),
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomInputTextfiled(
                hintText: 'Phone',
                widget: CountryCodePicker(
                  padding: EdgeInsets.all(0),
                  onChanged: (e) => print(e.toLongString()),
                  initialSelection: 'CA',
                  favorite: ['US', 'CN'],
                  showFlagDialog: true,
                  comparator: (a, b) => b.name.compareTo(a.name),
                  onInit: (code) => print(
                      "on init ${code.name} ${code.dialCode} ${code.name}"),
                ),
              ),
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
                      .popAndPushNamed(RouterPages.DriverRegConfirm);
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

class CustomInputTextfiled extends StatelessWidget {
  const CustomInputTextfiled({
    Key key,
    this.widget,
    this.hintText,
  }) : super(key: key);

  final Widget widget;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: hintText,
          prefixIcon: widget,
        ),
        cursorColor: Colors.grey,
      ),
    );
  }
}
