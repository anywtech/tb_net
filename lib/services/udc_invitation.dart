import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:tb_net/utils/common_value.dart';
import 'package:tb_net/utils/logs.dart';

class UdcInvitation {
  Map linkPath;

  dispose() {
    linkPath = null;
  }

  initUdcInvitaion() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData data) async {
      return _handleLinks(data);
    }, onError: (OnLinkErrorException e) async {
      //  print('onLinkError');
      Logs.p.e(e.message);
    });

    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    return _handleLinks(data);
  }

  _handleLinks(PendingDynamicLinkData data) {
    final Uri naviLink = data?.link;
    if (naviLink != null) {
      var linkparams = naviLink.pathSegments.contains('linkparams');

      if (linkparams) {
        var linkType = naviLink.queryParameters['linktype'];

        if (linkType == CommonValue.LinkTypeInvite) {
          var code = naviLink.queryParameters['code'];
          var path = naviLink.queryParameters['path'];
          if (code != null) {
            linkPath = {"path": path, "code": code};
            return linkPath;
          }
        } else if (linkType == CommonValue.LinkTypeShare) {
          var code = naviLink.queryParameters['code'];
          print('code is $code');
          var path = naviLink.queryParameters['path'];
          if (code != null) {
            linkPath = {"path": path, "code": code};
            return linkPath;
          }
        }
      }
    }
  }

  //create a link
  //type = invite, share
  Future<String> createLink(String linkType,
      [String path, String inviteCode, String sid, String pid]) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://awtech.page.link',
      link: Uri.parse(
          'https://awtech.com/linkparams?linktype=$linkType&path=$path&code=$inviteCode&sid=$sid&pid=$pid'),
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

    final Uri linkAddr = shortLink.shortUrl;

    return linkAddr.toString();
  }
}
