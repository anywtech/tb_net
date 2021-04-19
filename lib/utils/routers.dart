import 'package:flutter/material.dart';
import 'package:tb_net/pages/deliver_address.dart';
import 'package:tb_net/pages/chat.dart';
import 'package:tb_net/pages/dispatcher.dart';
import 'package:tb_net/pages/drivers/driver.dart';
import 'package:tb_net/pages/edit_address.dart';
import 'package:tb_net/pages/error.dart';
import 'package:tb_net/pages/home.dart';
import 'package:tb_net/pages/login.dart';
import 'package:tb_net/pages/news.dart';
import 'package:tb_net/pages/notification_messages.dart';
import 'package:tb_net/pages/orders/orders.dart';
import 'package:tb_net/pages/profile.dart';
import 'package:tb_net/pages/profile_banner_card/cart.dart';
import 'package:tb_net/pages/profile_banner_card/following.dart';
import 'package:tb_net/pages/profile_banner_card/recent_viewed.dart';
import 'package:tb_net/pages/profile_settings/account/setting_email.dart';
import 'package:tb_net/pages/profile_settings/account/setting_mobile.dart';
import 'package:tb_net/pages/profile_settings/account/setting_profile.dart';
import 'package:tb_net/pages/profile_settings/setting.dart';
import 'package:tb_net/pages/register.dart';
import 'package:tb_net/pages/store/my_store.dart';
import 'package:tb_net/pages/wallet.dart';

//route name of pages
class RouterPages {
  static const String Dispatcher = "Dispatcher";
  static const String Login = "Login";
  static const String Register = "Register";
  static const String Home = "Home";
  static const String Error = "Error";
  static const String Profile = "Profile";
  static const String News = "News";
  static const String Chat = "Chat";
  static const String SettingProfile = "Profile and Security";
  static const String SettingMobile = "Mobile";
  static const String SettingEmail = "Email";
  static const String SettingPassword = "Password";
  static const String DelieverAddress = "Address";
  static const String EditingAddress = "EditingAddress";
  static const String Wallet = "Wallet";
  static const String Setting = "Setting";
  static const String NotificationMessages = "Messages";
  static const String RecentViewed = "Recent Viewed";
  static const String Following = "Following";
  static const String Cart = "Cart";
  static const String Orders = "Orders";
  static const String MyStore = "Store";
  static const String Driver = "Driver";
}

class Routers {
  /*  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static Future<dynamic> navTo(String routeName, {Object args}) {
    return navKey.currentState.pushNamed(routeName, arguments: args);
  }

  static navBack() {
    return navKey.currentState.pop();
  }
 */
  static MaterialPageRoute materialPageRoute(RouteSettings settings) {
    //MaterialPageRoute(builder: (context) => Login());
    // or MaterialPageRoute(builder: (context) => Login(parm: settings.arguments));
    switch (settings.name) {
      case RouterPages.Dispatcher:
        return MaterialPageRoute(builder: (context) => Dispatcher());
        break;
      case RouterPages.Login:
        return MaterialPageRoute(builder: (context) => Login());
        break;
      case RouterPages.Register:
        return MaterialPageRoute(
            builder: (context) => Register(
                  invitedBy: settings.arguments,
                ));
        break;
      case RouterPages.Home:
        return MaterialPageRoute(builder: (context) => Home());
        break;
      case RouterPages.Profile:
        return MaterialPageRoute(builder: (context) => Profile());
        break;
      case RouterPages.Driver:
        return MaterialPageRoute(builder: (context) => Driver());
        break;
      case RouterPages.MyStore:
        return MaterialPageRoute(builder: (context) => MyStore());
        break;
      case RouterPages.Orders:
        return MaterialPageRoute(builder: (context) => Orders());
        break;
      case RouterPages.Cart:
        return MaterialPageRoute(builder: (context) => Cart());
        break;
      case RouterPages.Following:
        return MaterialPageRoute(builder: (context) => Following());
        break;
      case RouterPages.RecentViewed:
        return MaterialPageRoute(builder: (context) => RecentViewed());
        break;
      case RouterPages.NotificationMessages:
        return MaterialPageRoute(builder: (context) => NotificationMessages());
        break;

      case RouterPages.Setting:
        return MaterialPageRoute(builder: (context) => Setting());
        break;
      case RouterPages.SettingProfile:
        return MaterialPageRoute(builder: (context) => SettingProfile());
        break;
      case RouterPages.SettingMobile:
        return MaterialPageRoute(builder: (context) => SettingMobile());
        break;
      case RouterPages.SettingEmail:
        return MaterialPageRoute(builder: (context) => SettingEmail());
        break;
      case RouterPages.DelieverAddress:
        return MaterialPageRoute(builder: (context) => DelieverAddress());
        break;
      case RouterPages.EditingAddress:
        return MaterialPageRoute(
            builder: (context) => EditingAddress(
                  type: settings.arguments,
                ));
        break;
      case RouterPages.Wallet:
        return MaterialPageRoute(builder: (context) => Wallet());
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
