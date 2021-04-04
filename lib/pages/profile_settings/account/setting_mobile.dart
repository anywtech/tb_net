import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:tb_net/widgets/mobile_textfiled.dart';

class SettingMobile extends StatefulWidget {
  @override
  _SettingMobileState createState() => _SettingMobileState();
}

class _SettingMobileState extends State<SettingMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouterPages.SettingMobile),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 80,
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15.0),
                //  color: Colors.green,
                child: Text(
                  'Current Mobile',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              MobileTextField(),
              Container(
                margin: EdgeInsets.only(bottom: 15.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListTile(
                  title: TextField(
                    scrollPadding: EdgeInsets.all(0),
                    autofocus: true,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: 'Binded Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 35.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListTile(
                  title: TextField(
                    scrollPadding: EdgeInsets.all(0),
                    autofocus: true,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: '',
                      border: InputBorder.none,
                    ),
                  ),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      side: BorderSide(color: Colors.orange, width: 1),
                    ),
                    child: Text('get code'),
                    onPressed: () {},
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15.0),
                //  color: Colors.green,
                child: Text(
                  'New Mobile',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              /* Container(
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
                    onInit: (code) => print(
                        "on init ${code.name} ${code.dialCode} ${code.name}"),
                  ),
                  title: TextField(
                    scrollPadding: EdgeInsets.all(0),
                    autofocus: true,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: 'New Mobile Number',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ), */
              MobileTextField(),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  // style: TextButton.styleFrom(backgroundColor: Colors.blue),
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
