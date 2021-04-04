import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:tb_net/widgets/input_text.dart';

class MobileTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      title: InputText(
        hintText: '1231231234',
      ),
    );
  }
}
