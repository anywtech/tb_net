import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:stretchy_header/stretchy_header.dart';
/* import 'package:provider/provider.dart';
import 'package:tb_net/providers/home.dart';
import 'package:tb_net/providers/login_form.dart';
import 'package:tb_net/widgets/home/locale_picker.dart';
import 'package:tb_net/widgets/home/time_shower.dart';
import 'package:tb_net/widgets/home/timer_stream.dart';

import 'package:tb_net/generated/l10n.dart'; */

class ProfileNew extends StatefulWidget {
  @override
  _ProfileNewState createState() => _ProfileNewState();
}

class _ProfileNewState extends State<ProfileNew> {
  final List<Locale> initialSystemLocales =
      WidgetsBinding.instance.window.locales;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.orange[200],
                    Colors.orange[400],
                    Colors.orange[600]
                  ]),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 8.0, bottom: 6.0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text('V'),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vanessa',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'vanessa@gmail.com',
                              style: TextStyle(fontSize: 14),
                            ),
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
                  margin: 8.0,
                  hrPadding: 30.0,
                  children: [
                    TwolineCard(
                      onTap: () {},
                      leadingText: "3",
                      trailingText: "Likes",
                    ),
                    TwolineCard(
                      onTap: () {},
                      leadingText: "3",
                      trailingText: "Following",
                    ),
                    TwolineCard(
                      onTap: () {},
                      leadingText: "3",
                      trailingText: "Coupons",
                    ),
                    TwolineCard(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouterPages.RecentViewed);
                      },
                      leadingText: "3",
                      trailingText: "Recents",
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
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
                        color: Colors.white,
                        margin: 15.0,
                        children: [
                          TwolineCard(
                            onTap: () {},
                            leadingText: "3",
                            trailingText: "Repay",
                            isBottom: true,
                            trailingColor: Colors.grey,
                          ),
                          TwolineCard(
                            onTap: () {},
                            leadingText: "3",
                            trailingText: "Delivering",
                            isBottom: true,
                            trailingColor: Colors.grey,
                          ),
                          TwolineCard(
                            onTap: () {},
                            leadingText: "3",
                            trailingText: "Remark",
                            isBottom: true,
                            trailingColor: Colors.grey,
                          ),
                          TwolineCard(
                            onTap: () {},
                            leadingText: "3",
                            trailingText: "Service",
                            isBottom: true,
                            trailingColor: Colors.grey,
                          ),
                        ],
                      ),
                      Rowcard(
                        title: 'BUSINESS',
                        color: Colors.white,
                        margin: 15.0,
                        children: [
                          TwolineCard(
                            onTap: () {},
                            leadingIcon: Icons.store,
                            trailingText: "Likes",
                            isBottom: true,
                            trailingColor: Colors.grey,
                          ),
                          TwolineCard(
                            onTap: () {},
                            leadingIcon: Icons.car_rental,
                            trailingText: "Driver",
                            isBottom: true,
                            trailingColor: Colors.grey,
                          ),
                          TwolineCard(
                            onTap: () {},
                            leadingIcon: Icons.business,
                            trailingText: "Agent",
                            isBottom: true,
                            trailingColor: Colors.grey,
                          ),
                          TwolineCard(
                            onTap: () {},
                            leadingIcon: Icons.refresh_outlined,
                            trailingText: "Store T",
                            isBottom: true,
                            trailingColor: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
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
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class Rowcard extends StatelessWidget {
  final double height;
  final String title;
  final Color color;
  final double margin;
  final List<Widget> children;
  final double hrPadding;

  const Rowcard({
    this.title,
    this.height,
    this.color,
    this.margin,
    this.children,
    this.hrPadding,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      decoration: color == null
          ? BoxDecoration()
          : BoxDecoration(
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
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 15),
                  color: color,
                  width: double.infinity,
                  child: Text(title),
                ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: hrPadding == null ? 15 : hrPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          )
        ],
      ),
    );
  }
}

class TwolineCard extends StatelessWidget {
  final String leadingText;
  final IconData leadingIcon;
  final String trailingText;
  final Color trailingColor;
  final Function() onTap;
  final bool isBottom;

  const TwolineCard({
    Key key,
    this.leadingText,
    this.leadingIcon,
    this.trailingText,
    this.trailingColor,
    this.isBottom,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            leadingIcon == null
                ? Text(
                    leadingText,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  )
                : Icon(
                    leadingIcon,
                    size: 22,
                  ),
            const SizedBox(
              height: 5,
            ),
            Text(
              trailingText,
              style: TextStyle(
                  fontSize: 12,
                  color: trailingColor == null ? Colors.black : Colors.grey),
            ),
            isBottom == null
                ? const SizedBox(
                    height: 5,
                  )
                : const SizedBox(
                    height: 15,
                  ),
          ],
        ),
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

class OurDelegate extends SliverPersistentHeaderDelegate {
  double toolBarHeight;
  //toolBarHeight Included in both
  double closedHeight;
  double openHeight;

  OurDelegate({
    this.toolBarHeight,
    this.closedHeight,
    this.openHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: toolBarHeight + openHeight,
      // color: Theme.of(context).primaryColorDark,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350"),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 64,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => toolBarHeight + openHeight;

  @override
  double get minExtent => toolBarHeight + closedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}