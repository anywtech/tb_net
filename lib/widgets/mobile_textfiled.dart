import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class MobileTextField extends StatelessWidget {
  const MobileTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        leading: CountryCodePicker(
          padding: EdgeInsets.all(0),
          onChanged: (e) => print(e.toLongString()),
          initialSelection: 'CA',
          favorite: ['US', 'CN'],
          showFlagDialog: true,
          comparator: (a, b) => b.name.compareTo(a.name),
          onInit: (code) =>
              print("on init ${code.name} ${code.dialCode} ${code.name}"),
        ),
        title: TextField(
          scrollPadding: EdgeInsets.all(0),
          autofocus: true,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 17),
            hintText: 'Current Mobile Number',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
