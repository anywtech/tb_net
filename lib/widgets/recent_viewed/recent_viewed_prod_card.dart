import 'package:flutter/material.dart';
import 'package:tb_net/widgets/recent_viewed/recent_viewed_listile.dart';

class RecentViewedProdCard extends StatelessWidget {
  const RecentViewedProdCard({
    Key key,
    this.item,
  }) : super(key: key);

  final Map item;

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
            child: Text(item["date"]),
          ),
          ...item["items"]
              .map(
                (e) => RecentViewedListile(
                  item: e,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
