import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/input_text.dart';
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
                margin: EdgeInsets.only(bottom: 15.0),
                //  color: Colors.green,
                child: Text(
                  'Current Mobile',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: MobileTextField(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListTile(
                  title: InputText(
                    hintText: 'binded email',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListTile(
                  title: InputText(
                    hintText: 'code from email',
                  ),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                        side: BorderSide(color: Colors.orange)),
                    onPressed: () {},
                    child: Text('get code'),
                  ),
                ),
              ),
              Divider(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15.0),
                //  color: Colors.green,
                child: Text(
                  'New Mobile',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: MobileTextField(),
              ),
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
