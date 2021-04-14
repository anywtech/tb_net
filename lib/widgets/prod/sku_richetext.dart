import 'package:flutter/material.dart';
import 'package:tb_net/models/proditemcard_in_cart.dart';

class SKURicheText extends StatelessWidget {
  const SKURicheText({
    Key key,
    this.skus,
  }) : super(key: key);

  final List<Sku> skus;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.grey,
          ),
          children: [
            for (var e in skus)
              ...e
                  .toMap()
                  .entries
                  .map((e) => e.key == "name"
                      ? TextSpan(
                          text: '${e.value} : ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ))
                      : TextSpan(text: '${e.value}  '))
                  .toList(),
          ]),
    );
  }
}
