import 'package:flutter/material.dart';
import 'package:tb_net/utils/gridview_layouts.dart';

class RecommendationStaggeredView extends StatelessWidget {
  const RecommendationStaggeredView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 30.0,
        left: 15.0,
      ),
      child: Wrap(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              'You May Like',
              style: TextStyle(color: Colors.orange),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              'Service a vous par tout',
              style: TextStyle(fontSize: 14),
            ),
          ),

          //listcard of production of flow layout wrap
          /*  ...recommendedItems
              .map(
                (e) => ProdItemListCard(prodItem: e),
              )
              .toList(), */
          PinterestGrid(),
        ],
      ),
    );
  }
}
