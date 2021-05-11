import 'package:flutter/material.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/utils/home_standard_gridview.dart';

class HomeCol2ProdList extends StatelessWidget {
  const HomeCol2ProdList({
    Key key,
    this.prodItemPortaitCard,
  }) : super(key: key);

  final List<ProdItemPortaitCard> prodItemPortaitCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey[100],
              blurRadius: 2,
            ),
          ]),
      child: HomeStandardGrid(prodItemPortaitCard: prodItemPortaitCard),
    );
  }
}
