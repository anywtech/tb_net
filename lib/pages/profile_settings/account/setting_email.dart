import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:tb_net/widgets/form_textfiled.dart';

class SettingEmail extends StatefulWidget {
  @override
  _SettingEmailState createState() => _SettingEmailState();
}

class _SettingEmailState extends State<SettingEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouterPages.SettingEmail),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 80,
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text(
                  'Current Email',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              FormTextFiled(
                  leading: false,
                  trailing: false,
                  hintText: 'enter current email'),
              FormTextFiled(
                leading: true,
                trailing: false,
                hintText: 'binded mobile',
                leadingWidget: CountryCodePicker(
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
              FormTextFiled(
                leading: false,
                trailing: true,
                trailingWidget: TextButton(
                  style: TextButton.styleFrom(
                    side: BorderSide(color: Colors.orange, width: 1),
                  ),
                  child: Text('get code'),
                  onPressed: () {},
                ),
              ),
              const Divider(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  'New Email',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              FormTextFiled(
                leading: false,
                trailing: false,
                hintText: 'enter new email',
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  child: Text(
                    'Bind',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/* 
class CustomDropDown extends StatelessWidget {
  final value;
  final List<String> itemsList;
  final Color dropdownColor;
  final Function(dynamic value) onChanged;
  const CustomDropDown({
    @required this.value,
    @required this.itemsList,
    this.dropdownColor,
    @required this.onChanged,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: DropdownButton(
            // isExpanded: true,
            dropdownColor: dropdownColor,
            value: value,
            items: itemsList
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            onChanged: (value) => onChanged(value),
          ),
        ),
      ),
    );
  }
}
 */
