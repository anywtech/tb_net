import 'package:flutter/material.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/pages/chat.dart';

class HomeStandardGrid extends StatelessWidget {
  const HomeStandardGrid({
    Key key,
    this.prodItemPortaitCard,
  }) : super(key: key);

  final List<ProdItemPortaitCard> prodItemPortaitCard;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: prodItemPortaitCard.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 10,
          childAspectRatio: .75),
      itemBuilder: (context, index) => StandardGridItemCard(
        prodItemPortaitCard: prodItemPortaitCard[index],
      ),
    );
  }
}

class HomeCol3StandardGrid extends StatelessWidget {
  const HomeCol3StandardGrid({
    Key key,
    this.crossAxisCount,
    this.childAspectRatio,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.prods,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final List<ProdItemPortaitCard> prods;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      // addAutomaticKeepAlives: true,
      itemCount: prods.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio),
      itemBuilder: (context, index) => Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(prods[index].image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  prods[index].brand,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
