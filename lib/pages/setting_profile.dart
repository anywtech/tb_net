import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';

class SettingProfile extends StatelessWidget {
  updateNickname(BuildContext context, double height, String hintText) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouterPages.SettingProfile),
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
            children: [
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                margin: EdgeInsets.only(bottom: 25),
                height: 100,
                width: 100,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('https://i.stack.imgur.com/Hire2.png'),
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
              SettingListile(
                tapEvent: () {},
                title: 'ALIZII ID',
                values: '200010003000MMMM',
                isEditable: false,
              ),
              SettingListile(
                tapEvent: () {
                  udpateNickname(context);
                },
                title: 'Nick name',
                values: 'Vanessa',
                isEditable: true,
              ),
              SettingListile(
                tapEvent: () {},
                title: 'Mobile',
                values: '+1 123******9',
                isEditable: true,
              ),
              SettingListile(
                tapEvent: () {},
                title: 'E-mail',
                values: 'email@alizii.com',
                isEditable: true,
              ),
              SettingListile(
                tapEvent: () {},
                title: 'Address',
                values: '',
                isEditable: true,
              ),
              SettingListile(
                tapEvent: () {},
                title: 'Wallet',
                values: '',
                isEditable: true,
              ),
              SettingListile(
                tapEvent: () {},
                title: 'Ceritfication',
                values: 'Uncertified',
                textStyle: TextStyle(color: Colors.red),
                isEditable: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  udpateNickname(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                height: 200,
                child: ListTile(
                  title: TextField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: 'Nick name',
                      suffixIcon: IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () {
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                content: Text('updated'),
                              ),
                            );
                          }),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class SettingListile extends StatelessWidget {
  final Function tapEvent;
  final String title;
  final String values;
  final TextStyle textStyle;
  final bool isEditable;

  const SettingListile({
    this.tapEvent,
    this.title,
    this.values,
    this.textStyle,
    this.isEditable,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11.0),
        child: Row(
          children: [
            Text(title),
            Spacer(),
            Text(
              values,
              style: textStyle,
            ),
            isEditable
                ? Icon(Icons.chevron_right_outlined)
                : SizedBox(
                    width: 8.0,
                  ),
          ],
        ),
      ),
    );
  }
}
