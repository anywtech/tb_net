import 'package:flutter/material.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/utils/global_pref.dart';

class HomeTopSaleCardItem extends StatelessWidget {
  const HomeTopSaleCardItem({
    Key key,
    this.prodItemPortaitCard,
  }) : super(key: key);

  final ProdItemPortaitCard prodItemPortaitCard;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: GlobalPref.of(context).width - 30,
        height: GlobalPref.of(context).width * .2,
        margin: EdgeInsets.only(bottom: 10.0),
        child: Row(children: [
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 10.0),
            width: GlobalPref.of(context).width * .2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[200],
              /*  image: DecorationImage(
                image: AssetImage(
                    'assets/img/home/bag_1.png'), // NetworkImage(prodItemPortaitCard.image),
                fit: BoxFit.fill,
              ), */
            ),
            child: Image(
              image: AssetImage('assets/img/home/bag_1.png'),
            ),
          ),
          Container(
            width: GlobalPref.of(context).width * .6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prodItemPortaitCard.name,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  '\$${prodItemPortaitCard.price.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0),
          ),
        ),
        child: Text(
          'Top1',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 10.0,
          ),
        ),
      ),
    ]);
  }
}
