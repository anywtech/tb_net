import 'package:flutter/material.dart';
import 'package:tb_net/pages/chat.dart';
import 'package:tb_net/pages/error.dart';
import 'package:tb_net/pages/home.dart';
import 'package:tb_net/pages/login.dart';
import 'package:tb_net/pages/news.dart';
import 'package:tb_net/pages/profile.dart';
import 'package:tb_net/pages/register.dart';

//route name of pages
class RouterPages {
  static const String Login = "Login";
  static const String Register = "Register";
  static const String Home = "Home";
  static const String Error = "Error";
  static const String Profile = "Profile";
  static const String News = "News";
  static const String Chat = "Chat";
}

class Routers {
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static Future<dynamic> navTo(String routeName, {Object args}) {
    return navKey.currentState.pushNamed(routeName, arguments: args);
  }

  static navBack() {
    return navKey.currentState.pop();
  }

  static MaterialPageRoute materialPageRoute(RouteSettings settings) {
    //MaterialPageRoute(builder: (context) => Login());
    // or MaterialPageRoute(builder: (context) => Login(parm: settings.arguments));
    switch (settings.name) {
      case RouterPages.Login:
        return MaterialPageRoute(builder: (context) => Login());
        break;
      case RouterPages.Register:
        return MaterialPageRoute(builder: (context) => Register());
        break;
      case RouterPages.Home:
        return MaterialPageRoute(builder: (context) => Home());
        break;
      case RouterPages.Profile:
        return MaterialPageRoute(builder: (context) => Profile());
        break;
      case RouterPages.News:
        return MaterialPageRoute(
            builder: (context) => News(
                  invitedBy: settings.arguments,
                ));
        break;
      case RouterPages.Chat:
        return MaterialPageRoute(builder: (context) => Chat());
        break;
      case RouterPages.Error:
        return MaterialPageRoute(builder: (context) => Error());
        break;
      default:
        return MaterialPageRoute(builder: (context) => Login());
        break;
    }
  }
}
