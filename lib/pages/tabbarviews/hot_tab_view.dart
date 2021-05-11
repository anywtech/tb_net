import 'package:flutter/material.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/utils/global_pref.dart';
import 'package:tb_net/utils/home_standard_gridview.dart';
import 'package:tb_net/widgets/footer.dart';
import 'package:tb_net/widgets/home/borkercircle.dart';
import 'package:tb_net/widgets/home/home_col2_prod_list.dart';
import 'package:tb_net/widgets/home/home_event_card.dart';
import 'package:tb_net/widgets/home/home_promotion_area.dart';
import 'package:tb_net/widgets/home/home_top_sale_card_item.dart';
import 'package:tb_net/widgets/home/homelev2_ad_banner.dart';
import 'package:tb_net/widgets/home/homelevl1_ad_banner.dart';

class HotTabView extends StatelessWidget {
  const HotTabView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            width: GlobalPref.of(context).width,
            child: Column(
              children: [
                HomeLevl1AdBanner(),
                const SizedBox(
                  height: 15.0,
                ),
                //collabration sales
                HomePromotionArea(),

                //level2 adv
                const SizedBox(
                  height: 15.0,
                ),
                HomeLevl2AdBanner(),

                const SizedBox(
                  height: 15.0,
                ),

                //broker ranking
                BrokerCircle(),

                // products 2 cols
                const SizedBox(
                  height: 15.0,
                ),
                HomeCol2ProdList(
                  prodItemPortaitCard: recommendedItems4,
                ),

                // ranking by category
                const SizedBox(
                  height: 15.0,
                ),
                HomeEventCard(
                  typeIcon: 'assets/icon/svg/crown.svg',
                  typeName: 'TOP SALEs',
                  subName: 'Mobile',
                  isSvg: true,
                  children: recommendedItems3
                      .map((e) => HomeTopSaleCardItem(
                            prodItemPortaitCard: e,
                          ))
                      .toList(),
                ),
                // products 2 cols
                const SizedBox(
                  height: 15.0,
                ),
                HomeCol2ProdList(
                  prodItemPortaitCard: recommendedItems4,
                ),
                // products 2 cols
                const SizedBox(
                  height: 15.0,
                ),

                HomeEventCard(
                  typeIcon: 'assets/icon/svg/crown.svg',
                  typeName: 'Featured',
                  subName: 'Fashion Shoes',
                  isSvg: true,
                  children: [
                    HomeCol3StandardGrid(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 30,
                      childAspectRatio: 0.75,
                      prods: recommendedItems6,
                    )
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                HomeCol2ProdList(
                  prodItemPortaitCard: recommendedItems,
                ),
                // ranking by category
                const SizedBox(
                  height: 15.0,
                ),
                HomeEventCard(
                  typeIcon: 'assets/img/home/costco.png',
                  typeName: 'Costco',
                  subName: 'Spring Deal',
                  isSvg: false,
                  padding: EdgeInsets.only(
                    top: 5.0,
                    right: 5.0,
                    left: 5.0,
                  ),
                  children: [
                    HomeSaveEventStandardGrid(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.95,
                      prods: savedItems,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                HomeCol2ProdList(
                  prodItemPortaitCard: recommendedItems,
                ),
                Footer(
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
