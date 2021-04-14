import 'package:flutter/material.dart';
import 'package:tb_net/models/image_data.dart';
import 'package:tb_net/models/recent_viewed_card.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/footer.dart';
import 'package:tb_net/widgets/rec_staggered_view.dart';
import 'package:tb_net/widgets/recent_viewed/recent_viewed_prod_card.dart';

class RecentViewed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouterPages.RecentViewed),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Clear All',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            //viewed list
            ...recentViewedList
                .map(
                  (e) => RecentViewedProdCard(recentViewedCard: e),
                )
                .toList(),

            // list of recommendation
            RecommendationStaggeredView(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
