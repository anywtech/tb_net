import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_net/pages/home.dart';
import 'package:tb_net/pages/login.dart';
import 'package:tb_net/pages/register.dart';
import 'package:tb_net/providers/login_form.dart';
import 'package:tb_net/services/udc_invitation.dart';
import 'package:tb_net/utils/locator.dart';
import 'package:tb_net/utils/routers.dart';

class Dispatcher extends StatefulWidget {
  @override
  _DispatcherState createState() => _DispatcherState();
}

class _DispatcherState extends State<Dispatcher> with WidgetsBindingObserver {
  Map linkpath; // = locator.get<UdcInvitation>().linkPath;
  @override
  void initState() {
    getLinkPath(context);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print(state);

    if (state == AppLifecycleState.resumed) {
      if (context.read<LoginFormProvider>().currentUser == "") {
        Future.delayed(Duration(milliseconds: 50), () {
          Provider.of<LoginFormProvider>(context, listen: false)
              .setRedirectLink(context, RouterPages.Login);
        });
      }
    }
  }

  getLinkPath(BuildContext context) async {
    linkpath = await locator.get<UdcInvitation>().initUdcInvitaion();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    linkpath = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: context.read<LoginFormProvider>().onResume(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Scaffold(body: CircularProgressIndicator());
            default:
              if (snapshot.hasError)
                return Login(); //Text('Error: ${snapshot.error}');
              else
                return snapshot.data != "" && snapshot.data != null
                    ? Home()
                    : (linkpath != null &&
                            linkpath["path"] == RouterPages.Register)
                        ? Register(invitedBy: linkpath["code"])
                        : Login();
          }
        },
      ),
    );
  }
}
