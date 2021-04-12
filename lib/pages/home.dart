import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tb_net/providers/home.dart';
import 'package:tb_net/providers/login_form.dart';
import 'package:tb_net/services/udc_invitation.dart';
import 'package:tb_net/storage/storage_manager.dart';
import 'package:tb_net/utils/common_value.dart';
import 'package:tb_net/utils/locator.dart';
import 'package:tb_net/utils/routers.dart';

class Home extends StatefulWidget {
  /* final linkpath;

  const Home({Key key, this.linkpath}) : super(key: key);
 */
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  var currentUser;

  @override
  void initState() {
    currentUser =
        Provider.of<LoginFormProvider>(context, listen: false).currentUser;
    //get the default locale settings
    Provider.of<HomeProvider>(context, listen: false).getLocale();

    //get the link path
    Provider.of<LoginFormProvider>(context, listen: false)
        .setRedirectLink(context, RouterPages.Home);

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print(state);
    if (state == AppLifecycleState.resumed) {
      // await locator.get<UdcInvitation>().initUdcInvitaion();
      Future.delayed(Duration(milliseconds: 200), () {
        Provider.of<LoginFormProvider>(context, listen: false)
            .setRedirectLink(context, RouterPages.Home);
      });
    }
  }

  @override
  void dispose() {
    currentUser = null;
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $currentUser'),
        actions: [
          ElevatedButton(
            onPressed: () async {
              String token;
              try {
                token = await locator.get<StorageManager>().get('token');
              } catch (e) {
                token = null;
              }

              if (token == "" || token == null) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RouterPages.Login, (_) => false);
              }
            },
            child: Text('get it the token'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                child: Text('Map'),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.orange.withOpacity(0.5),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Wrap(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        var shareLink =
                            await locator.get<UdcInvitation>().createLink(
                                  CommonValue.LinkTypeInvite,
                                  RouterPages.Register,
                                  'userid1',
                                );
                        /* showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (_) => AlertDialog(
                            title: Text('shareLink'),
                            content: Text(shareLink),
                          ),
                        ); */
                        await Share.share(
                          shareLink,
                        );
                      },
                      child: Text('Invite a friend'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var shareLink =
                            await locator.get<UdcInvitation>().createLink(
                                  CommonValue.LinkTypeShare,
                                  RouterPages.News,
                                  'page1',
                                );

                        await Share.share(
                          shareLink,
                        );
                      },
                      child: Text('share a page'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Get Contact list'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              child: Text('home'),
              onPressed: () {},
            ),
            TextButton(
              child: Text('news'),
              onPressed: () {
                Navigator.pushNamed(context, RouterPages.News);
              },
            ),
            TextButton(
              child: Text('chat'),
              onPressed: () {
                Navigator.pushNamed(context, RouterPages.Chat);
              },
            ),
            TextButton(
              child: Text('profile'),
              onPressed: () {
                Navigator.pushNamed(context, RouterPages.ProfileNew);
              },
            ),
          ],
        ),
      ),
    );
  }
}
