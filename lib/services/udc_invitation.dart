import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:tb_net/utils/logs.dart';
import 'package:tb_net/utils/routers.dart';

class UdcInvitation {
  Future initUdcInvitaion(BuildContext context) async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData data) async {
      _handleLinks(data, context);
    }, onError: (OnLinkErrorException e) async {
      //  print('onLinkError');
      Logs.p.e(e.message);
    });

    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    _handleLinks(data, context);
  }

  void _handleLinks(PendingDynamicLinkData data, BuildContext context) {
    final Uri inviteLink = data?.link;
    if (inviteLink != null) {
      var isInvited = inviteLink.pathSegments.contains('invite');

      if (isInvited) {
        var code = inviteLink.queryParameters['code'];

        if (code != null) {
          // Routers.navTo(RouterPages.News, args: code);
          Navigator.of(context).pushNamed(RouterPages.News, arguments: code);
        }
      }
    }
  }

  //create a link
  //type = invite, share
  Future<String> createLink(String type,
      [String path, String inviterCode, String sid, String pid]) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://awtech.page.link',
      link: Uri.parse(
          'https://awtech.com/linkparams?type=$type&path=$path&code=$inviterCode&sid=$sid&pid=$pid'),
      androidParameters: AndroidParameters(
        packageName: 'com.anywtech.tb_net',
        //minimumVersion: 0,
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.anywtech.tb_net.bundle',
        //minimumVersion: '0',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: 'Get UDC\$',
        description:
            'UDC is a new digital currency defined by all the engagers worldwide. Follow me to claim your UDC.',
        imageUrl: Uri.parse(
            'https://images2.markets.businessinsider.com/603d460e87d37600190d0780?format=jpeg'),
      ),
    );

    final ShortDynamicLink shortLink = await parameters.buildShortLink();

    final Uri inviteLink = shortLink.shortUrl;

    return inviteLink.toString();
  }
}
