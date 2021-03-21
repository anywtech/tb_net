import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:tb_net/utils/routers.dart';

class UdcInvitation {
  Future initUdcInvitaion() async {
   
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData data) async {
      _handleLinks(data);
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

     final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    _handleLinks(data);

  }

  void _handleLinks(PendingDynamicLinkData data) {
    final Uri inviteLink = data?.link;
    if (inviteLink != null) {
      var isInvited = inviteLink.pathSegments.contains('invite');

      if (isInvited) {
        var code = inviteLink.queryParameters['code'];

        print('code is $code');

        if (code != null) {
          Routers.navTo(RouterPages.News, args: code);
        }
      }
    }
  }

  //create a link
  Future<String> createInvitation(String inviterCode) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://awtech.page.link',
      link: Uri.parse('https://awtech.com/invite?code=$inviterCode'),
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

    print(inviteLink);
    return inviteLink.toString();
  }
}
