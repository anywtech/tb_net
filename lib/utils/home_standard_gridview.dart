import 'package:flutter/material.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/pages/chat.dart';
import 'package:tb_net/utils/global_pref.dart';

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

class StoreFeaturedCol3StandardGrid extends StatelessWidget {
  const StoreFeaturedCol3StandardGrid({
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
              color: Colors.grey[50],
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    prods[index].name,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${prods[index].price.toString()}',
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleIcon(
                            icon:
                                'https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg',
                          ),
                          Positioned(
                            right: 9,
                            child: CircleIcon(
                              icon:
                                  'https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg',
                            ),
                          ),
                          Positioned(
                            right: 18,
                            child: CircleIcon(
                              icon:
                                  'https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    Key key,
    this.icon,
  }) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(icon),
          //'https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg'),
        ),
      ),
    );
  }
}

class HomeSaveEventStandardGrid extends StatelessWidget {
  const HomeSaveEventStandardGrid({
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
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saved',
                        style: TextStyle(
                            color: Colors.orange[900],
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                      Text(
                        '${prods[index].saved}\$',
                        style: TextStyle(
                            color: Colors.orange[900],
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Vinaigrette et marinade au sesame grille Kewipe',
                        style: TextStyle(fontSize: 12),
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        prods[index].desc,
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        '1133999',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Image(
                    image: NetworkImage(prods[index].image),
                    // 'https://assets.epicurious.com/photos/59275098ec6b83576ab8ee30/1:1/w_1495,h_1495,c_limit/olive-oil-bottles_25052017.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Prix:',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${prods[index].marketPrice}\$',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Saved:',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '-${prods[index].saved}\$',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey[500],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Price:',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${prods[index].price}\$',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CustomRoundButton(
                      text: 'Buy',
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRoundButton extends StatelessWidget {
  const CustomRoundButton({
    Key key,
    this.text,
    this.onTap,
  }) : super(key: key);
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            Colors.orange[100],
            Colors.orange[200],
            Colors.orange[300],
            Colors.orange[200],
          ]),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 10.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
