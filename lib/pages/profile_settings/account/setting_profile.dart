import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/setting_listile.dart';

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
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          width: double.infinity,
          //height: MediaQuery.of(context).size.height - 80,
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                margin: const EdgeInsets.only(bottom: 25),
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
                leading: Text('ALIZII ID'),
                title: '200010003000MMMM',
                trailing: false,
                alignment: "Right",
              ),
              SettingListile(
                tapEvent: () {
                  udpateNickname(context);
                },
                leading: Text('Nick name'),
                title: 'Vanessa',
                alignment: "Right",
              ),
              SettingListile(
                tapEvent: () {
                  Navigator.of(context).pushNamed(RouterPages.SettingMobile);
                },
                leading: Text('Mobile'),
                title: '+1 123******9',
                alignment: "Right",
              ),
              SettingListile(
                tapEvent: () {
                  Navigator.of(context).pushNamed(RouterPages.SettingEmail);
                },
                leading: Text('E-mail'),
                title: 'email@alizii.com'.replaceRange(3, 12, "******"),
                alignment: "Right",
              ),
              SettingListile(
                tapEvent: () {
                  Navigator.of(context).pushNamed(RouterPages.DelieverAddress);
                },
                leading: Text('Address'),
                alignment: "Right",
              ),
              SettingListile(
                tapEvent: () {
                  Navigator.of(context).pushNamed(RouterPages.Wallet);
                },
                leading: Text('Wallet'),
                alignment: "Right",
              ),
              SettingListile(
                tapEvent: () {},
                leading: Text('Ceritfication'),
                title: 'Uncertified',
                textStyle: TextStyle(color: Colors.red),
                alignment: "Right",
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
                    autofocus: true,
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
