import 'package:flutter/material.dart';
import 'package:tb_net/widgets/home/home_promotion_card_horizontal.dart';

class HotSale extends StatelessWidget {
  const HotSale({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'HOT SALE',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 12.0,
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 15.0,
        ),
        HomePromotionCardHorizontal(
          imgPath: 'assets/img/home/602d9df90edb6a81219b2847face67b6.png',
          title: 'AI Pet Bowl',
          price: 99.99,
        ),
        HomePromotionCardHorizontal(
          imgPath: 'assets/img/home/919e6d1fda4c61fedbb35ea7aec3f61f.png',
          title: 'Balance Car',
          price: 1999.99,
        ),
      ],
    );
  }
}
