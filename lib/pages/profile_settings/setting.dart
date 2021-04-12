import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/setting_listile.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouterPages.Setting),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          width: double.infinity,
          // height: MediaQuery.of(context).size.height - 80,
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Account',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SettingListile(
                leading: Icon(Icons.account_box),
                title: 'Profile and security',
                alignment: "Left",
              ),
              SettingListile(
                leading: Icon(Icons.account_box),
                title: 'Profile and security',
                alignment: "Left",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'General',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SettingListile(
                leading: Icon(Icons.notifications_none),
                title: 'Notification',
                alignment: "Left",
              ),
              SettingListile(
                leading: Icon(Icons.settings),
                title: 'General settings',
                alignment: "Left",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'About',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SettingListile(
                leading: Icon(Icons.book_outlined),
                title: 'Notification',
                alignment: "Left",
              ),
              SettingListile(
                leading: Icon(Icons.settings),
                title: 'General settings',
                alignment: "Left",
              ),
              SettingListile(
                leading: Icon(Icons.question_answer_outlined),
                title: 'Feedback and support',
                alignment: "Left",
              ),
              SettingListile(
                leading: Icon(Icons.logout),
                title: 'Log out',
                alignment: "Left",
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 30.0, bottom: 25.0),
                child: Text(
                  'ALIZII Version 0.1.0',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
