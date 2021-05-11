import 'package:flutter/material.dart';

class HomePromotionCardHorizontal extends StatelessWidget {
  const HomePromotionCardHorizontal({
    Key key,
    this.imgPath,
    this.title,
    this.price,
  }) : super(key: key);

  final String imgPath;
  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10.0),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgPath), fit: BoxFit.fill),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(
              '\$${price.toString()}',
              style: TextStyle(color: Colors.red),
            )
          ],
        )
      ],
    );
  }
}
