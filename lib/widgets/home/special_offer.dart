import 'package:flutter/material.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/widgets/home/time_limited_card.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    Key key,
    this.items,
  }) : super(key: key);

  final List<ProdItemPortaitCard> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'SPECIAL OFFER',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: items
              .map(
                (item) => TimeLimitedCard(
                  price: item.price,
                  marketPrice: item.marketPrice,
                  imgPath: item.image,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
