import 'package:flutter/material.dart';

class TimeLimitedCard extends StatelessWidget {
  const TimeLimitedCard({
    Key key,
    this.price,
    this.marketPrice,
    this.imgPath,
    this.onTap,
  }) : super(key: key);

  final double price;
  final double marketPrice;
  final String imgPath;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 56.0,
          width: 56.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/img/home/3bd6ba24fc8e816eb5c678d0cc4ec1e2.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Image(
              image: AssetImage(
                  'assets/img/home/3bd6ba24fc8e816eb5c678d0cc4ec1e2.png'),
              // NetworkImage(imgPath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text('\$${price.toString()}', textAlign: TextAlign.center),
        Text(
          '\$${marketPrice.toString()}',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[400],
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
