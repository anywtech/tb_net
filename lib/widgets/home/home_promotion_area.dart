import 'package:flutter/material.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/widgets/home/hotsale.dart';
import 'package:tb_net/widgets/home/new_arrival.dart';
import 'package:tb_net/widgets/home/special_offer.dart';
import 'package:tb_net/widgets/home/time_limit_sale.dart';

class HomePromotionArea extends StatelessWidget {
  const HomePromotionArea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey[100],
              blurRadius: 2,
            )
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TimelimitSale(
                items: timeLimitedSales,
              ),
              SpecialOffer(
                items: specialOffers,
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HotSale(),
              NewArrival(),
            ],
          ),
        ],
      ),
    );
  }
}
