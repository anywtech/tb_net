import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tb_net/utils/global_pref.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/common/banner_gradient_and_image.dart';
import 'package:tb_net/widgets/common/custom_button.dart';
import 'package:tb_net/widgets/common/indicator_card.dart';

class MyStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                BannerGradientAndImage(
                  imgPath: 'assets/img/store/banner.jpg',
                  title: 'ALIZII STORE',
                  subTitle: 'Make life happy and ease',
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Why Join us',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'ALIZII makes life better!',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: IndicatorCard(
                              imgPath: 'assets/img/location.png',
                              title: 'Accurate Exposure',
                              desc:
                                  'Reache to all potential clients rapidly and precisely',
                            ),
                          ),
                          Expanded(
                            child: IndicatorCard(
                              imgPath: 'assets/img/people.png',
                              title: 'Accurate Exposure',
                              desc:
                                  'Reache to all potential clients rapidly and precisely',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: IndicatorCard(
                              imgPath: 'assets/img/circular.png',
                              title: 'Accurate Exposure',
                              desc:
                                  'Reache to all potential clients rapidly and precisely',
                            ),
                          ),
                          Expanded(
                            child: IndicatorCard(
                              imgPath: 'assets/img/store.png',
                              title: 'Accurate Exposure',
                              desc:
                                  'Reache to all potential clients rapidly and precisely',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'Your Next Flagshops',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'New Vision + Smart Way = High Profit',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(width: 15.0),
                            FlagShopCard(),
                            const SizedBox(width: 15.0),
                            FlagShopCard(),
                            const SizedBox(width: 15.0),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 80.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomBackLeadingInSafeArea(),
          Positioned(
            bottom: 15,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomBottomFixedButton(
                text: 'OPEN MY STORE RIGHT NOW',
                onTap: () {
                  Navigator.of(context)
                      .popAndPushNamed(RouterPages.RegisterStore);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBackLeadingInSafeArea extends StatelessWidget {
  const CustomBackLeadingInSafeArea({
    Key key,
    this.iconPath,
  }) : super(key: key);

  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50.0,
        child: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                iconPath == null
                    ? "assets/icon/svg/md-arrow_back.svg"
                    : iconPath,
              ),
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

class FlagShopCard extends StatelessWidget {
  const FlagShopCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 45,
      margin: EdgeInsets.only(bottom: 50.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 5),
          color: Colors.grey[200],
          blurRadius: 10,
        ),
      ]),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * .5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
              color: Colors.red,
              image: DecorationImage(
                image: NetworkImage(
                    'https://web.uponor.hk/wp-content/uploads/2018/05/How-To-Build-A-Sustainable-Office-Space.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            tileColor: Colors.white,
            leading: Container(
              width: GlobalPref.of(context).pw(15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://logos-world.net/wp-content/uploads/2020/11/Costco-Wholesale-Logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            title: Text(
              'COSTCO',
              style: TextStyle(fontSize: 14.0),
            ),
            subtitle: Text(
              'Retail Wareshouse',
              style: TextStyle(fontSize: 12.0),
            ),
            trailing: Icon(
              Icons.open_in_new_outlined,
              size: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
