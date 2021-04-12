import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';
/* import 'package:provider/provider.dart';
import 'package:tb_net/providers/home.dart';
import 'package:tb_net/providers/login_form.dart';
import 'package:tb_net/widgets/home/locale_picker.dart';
import 'package:tb_net/widgets/home/time_shower.dart';
import 'package:tb_net/widgets/home/timer_stream.dart';

import 'package:tb_net/generated/l10n.dart'; */

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<Locale> initialSystemLocales =
      WidgetsBinding.instance.window.locales;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profle'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: Colors.orange[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('asdfasdfasf'),
                              Text('asdfasdfasf'),
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RouterPages.SettingProfile);
                            }),
                        Container(
                          child: Stack(
                              alignment: const Alignment(0.5, -0.6),
                              children: [
                                IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          RouterPages.SettingProfile);
                                    }),
                                GestureDetector(
                                  child: Icon(Icons.notifications_none),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        RouterPages.NotificationMessages);
                                  },
                                ),
                                CircleAvatar(
                                  radius: 3.0,
                                  backgroundColor: Colors.red,
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Rowcard(
                    height: MediaQuery.of(context).size.height * .15,
                    color: Colors.orange[300],
                    margin: 0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouterPages.Setting);
                    },
                    tileColor: Colors.white,
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    trailing: Icon(Icons.chevron_right_rounded),
                  ),
                  ListTile(
                    tileColor: Colors.white,
                    leading: Icon(Icons.info_outline),
                    title: Text('About us'),
                    trailing: Icon(Icons.chevron_right_rounded),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.18,
                right: 0,
                left: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'ALIZII VIP',
                                style: TextStyle(color: Colors.white),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    width: 1,
                                    color: Colors.white38,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text(
                                'ENJOY',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                '15% OFF',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                            Container(
                              child: Text(
                                'EACH ORDER',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Rowcard(
                        title: 'ORDERS',
                        height: MediaQuery.of(context).size.height * .06,
                        color: Colors.white,
                        margin: 15.0,
                      ),
                      Rowcard(
                        title: 'BUSINESS',
                        height: MediaQuery.of(context).size.height * .06,
                        color: Colors.white,
                        margin: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
      //NewWidget(initialSystemLocales: initialSystemLocales),
    );
  }
}

class Rowcard extends StatelessWidget {
  final double height;
  final String title;
  final Color color;
  final double margin;

  const Rowcard({
    this.title,
    this.height,
    this.color,
    this.margin,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      margin: EdgeInsets.only(bottom: margin),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
              blurRadius: 5,
              offset: Offset(0, 5),
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2),
        ],
      ),
      child: Wrap(
        children: [
          title == null
              ? Container()
              : Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                  color: color,
                  width: double.infinity,
                  child: Text(title),
                ),
          Container(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text(
                        '3',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Likes'),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '5',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Following'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '3',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Coupons'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '3',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Recents'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
/* 
class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    @required this.initialSystemLocales,
  }) : super(key: key);

  final List<Locale> initialSystemLocales;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Consumer<HomeProvider>(
          builder: (__, baseinfo, _) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                  height: MediaQuery.of(context).size.width - 220,
                  width: MediaQuery.of(context).size.width - 220,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image:
                          NetworkImage('https://i.stack.imgur.com/Hire2.png'),
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Provider.of<LoginFormProvider>(context, listen: false)
                      .signOff(context);
                },
                child: Text('log off'),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                    Provider.of<LoginFormProvider>(context, listen: false)
                        .currentUser),
              ),
              TimeShower(),
              SizedBox(
                height: 50.0,
              ),
              TimerStream(),
              SizedBox(
                height: 50.0,
              ),
              Text('system default lang is : ${Platform.localeName}'),
              Text(
                  'system default county code is ${Platform.localeName.split('_')[1]}'),
              SizedBox(
                height: 50.0,
              ),
              Text('app selected lang is : ${baseinfo.locale.languageCode})'),
              Text(
                  'app selected country code  is : ${baseinfo.locale.countryCode}'),
              SizedBox(
                height: 50.0,
              ),
              for (var locale in initialSystemLocales) Text(locale.toString()),
              SizedBox(
                height: 50.0,
              ),
              LocalePicker(iconData: Icons.work_outlined, T: baseinfo),
              SizedBox(
                height: 50.0,
              ),
              Text(S.of(context).pageHomeListTitle,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Text(S.of(context).pageHomeSamplePlaceholder("John"),
                  style: TextStyle(fontSize: 20)),
              Text(
                  S
                      .of(context)
                      .pageHomeSamplePlaceholdersOrdered("John", "Doe"),
                  style: TextStyle(fontSize: 20)),
              Text(S.of(context).pageHomeSamplePlural(2),
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 200.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */
