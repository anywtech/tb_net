import 'package:flutter/material.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/models/product/proddetail.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/home/time_limited_card.dart';

class TimelimitSale extends StatelessWidget {
  const TimelimitSale({
    Key key,
    this.items,
  }) : super(key: key);

  final List<ProdItemPortaitCard> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'TIME LIMIT SALE',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.red,
                fontSize: 12.0,
              ),
            ),
            /*  TextSpan(
              text: '10:19:01',
              style: TextStyle(
                color: Colors.red,
                fontSize: 10.0,
              ),
            ), */
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
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(
                          RouterPages.ProductDetail,
                          arguments: product001);
                    }),
              )
              .toList(),
        ),
      ],
    );
  }
}
