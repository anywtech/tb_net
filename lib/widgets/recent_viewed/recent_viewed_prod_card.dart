import 'package:flutter/material.dart';
import 'package:tb_net/models/recent_viewed_card.dart';
import 'package:tb_net/widgets/recent_viewed/recent_viewed_listile.dart';

class RecentViewedProdCard extends StatelessWidget {
  const RecentViewedProdCard({
    Key key,
    this.recentViewedCard,
  }) : super(key: key);

  final RecentViewedCard recentViewedCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15.0, top: 10.0),
            child: Text(recentViewedCard.date),
          ),
          ...recentViewedCard.rvItems
              .map(
                (e) => RecentViewedListile(
                  rvItem: e,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
