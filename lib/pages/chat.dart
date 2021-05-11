import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/models/product/proddetail.dart';
import 'package:tb_net/utils/global_pref.dart';
import 'package:tb_net/utils/home_standard_gridview.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/footer.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 110, //+ GlobalPref.of(context).height * .1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.orange[200],
                    Colors.orange[400],
                    Colors.orange[600]
                  ]),
            ),
          ),
          Column(
            children: [
              HeaderBar(),
              HeaderCategoryBar(),
            ],
          ),
          Positioned(
            top: 110,
            left: 0,
            bottom: 0,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                width: GlobalPref.of(context).width,
                child: Column(
                  children: [
                    HomeLevl1AdBanner(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    //collabration sales
                    HomePromotionArea(),

                    //level2 adv
                    const SizedBox(
                      height: 15.0,
                    ),
                    HomeLevl2AdBanner(),

                    const SizedBox(
                      height: 15.0,
                    ),

                    //broker ranking
                    BrokerCircle(),

                    // products 2 cols
                    const SizedBox(
                      height: 15.0,
                    ),
                    HomeCol2ProdList(
                      prodItemPortaitCard: recommendedItems4,
                    ),

                    // ranking by category
                    const SizedBox(
                      height: 15.0,
                    ),
                    HomeEventCard(
                      typeIcon: 'assets/icon/svg/crown.svg',
                      typeName: 'TOP SALEs',
                      subName: 'Mobile',
                      isSvg: true,
                      children: recommendedItems3
                          .map((e) => HomeTopSaleCardItem(
                                prodItemPortaitCard: e,
                              ))
                          .toList(),
                    ),
                    // products 2 cols
                    const SizedBox(
                      height: 15.0,
                    ),
                    HomeCol2ProdList(
                      prodItemPortaitCard: recommendedItems4,
                    ),
                    // products 2 cols
                    const SizedBox(
                      height: 15.0,
                    ),

                    HomeEventCard(
                      typeIcon: 'assets/icon/svg/crown.svg',
                      typeName: 'Featured',
                      subName: 'Fashion Shoes',
                      isSvg: true,
                      children: [
                        HomeCol3StandardGrid(
                          crossAxisCount: 3,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 30,
                          childAspectRatio: 0.75,
                          prods: recommendedItems6,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    HomeCol2ProdList(
                      prodItemPortaitCard: recommendedItems,
                    ),
                    // ranking by category
                    const SizedBox(
                      height: 15.0,
                    ),
                    HomeEventCard(
                      typeIcon: 'assets/img/home/costco.png',
                      typeName: 'Costco',
                      subName: 'Spring Deal',
                      isSvg: false,
                      padding: EdgeInsets.only(
                        top: 5.0,
                        right: 5.0,
                        left: 5.0,
                      ),
                      children: [
                        HomeSaveEventStandardGrid(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.95,
                          prods: savedItems,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    HomeCol2ProdList(
                      prodItemPortaitCard: recommendedItems,
                    ),
                    Footer(
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeEventCard extends StatelessWidget {
  const HomeEventCard({
    Key key,
    this.typeIcon,
    this.typeName,
    this.subName,
    this.children,
    this.isSvg,
    this.padding,
  }) : super(key: key);

  final String typeIcon;
  final bool isSvg;
  final String typeName;
  final String subName;
  final List<Widget> children;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding == null
          ? const EdgeInsets.only(
              top: 5.0,
              left: 10.0,
              right: 10.0,
            )
          : padding,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey[100],
              blurRadius: 6,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                width: 30.0,
                child: isSvg
                    ? SvgPicture.asset(
                        typeIcon,
                        fit: BoxFit.contain,
                      )
                    : Image(
                        image: AssetImage(typeIcon),
                      ),
              ),
              const SizedBox(width: 5.0),
              Text(
                typeName,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            subName,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15.0,
          ),
          if (children != null) ...children,
        ],
      ),
    );
  }
}

class HomeTopSaleCardItem extends StatelessWidget {
  const HomeTopSaleCardItem({
    Key key,
    this.prodItemPortaitCard,
  }) : super(key: key);

  final ProdItemPortaitCard prodItemPortaitCard;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: GlobalPref.of(context).width - 30,
        height: GlobalPref.of(context).width * .2,
        margin: EdgeInsets.only(bottom: 10.0),
        child: Row(children: [
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 10.0),
            width: GlobalPref.of(context).width * .2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[200],
              /*  image: DecorationImage(
                image: AssetImage(
                    'assets/img/home/bag_1.png'), // NetworkImage(prodItemPortaitCard.image),
                fit: BoxFit.fill,
              ), */
            ),
            child: Image(
              image: AssetImage('assets/img/home/bag_1.png'),
            ),
          ),
          Container(
            width: GlobalPref.of(context).width * .6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prodItemPortaitCard.name,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  '\$${prodItemPortaitCard.price.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0),
          ),
        ),
        child: Text(
          'Top1',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 10.0,
          ),
        ),
      ),
    ]);
  }
}

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

class NewArrival extends StatelessWidget {
  const NewArrival({
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
              text: 'NEW ARRIVAL',
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              NewArrivalContainer(
                  imgPath:
                      'assets/img/home/c837260b4e38856f327cf4453a9fda6c.png'),
              NewArrivalContainer(
                  imgPath:
                      'assets/img/home/b4bce84e729d1dd2e8b057809967f801.png'),
              NewArrivalContainer(
                  imgPath:
                      'assets/img/home/e82532a66c2d66322258accd1fcf3dbd.png'),
              NewArrivalContainer(
                  imgPath:
                      'assets/img/home/b4bce84e729d1dd2e8b057809967f801.png'),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NewArrivalContainer(
                    imgPath:
                        'assets/img/home/c837260b4e38856f327cf4453a9fda6c.png'),
                NewArrivalContainer(
                    imgPath:
                        'assets/img/home/b4bce84e729d1dd2e8b057809967f801.png'),
                NewArrivalContainer(
                    imgPath:
                        'assets/img/home/e82532a66c2d66322258accd1fcf3dbd.png'),
                NewArrivalContainer(
                    imgPath:
                        'assets/img/home/b4bce84e729d1dd2e8b057809967f801.png'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

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
                      Navigator.of(context).pushNamed(RouterPages.ProductDetail,
                          arguments: product001);
                    }),
              )
              .toList(),
        ),
      ],
    );
  }
}

class HomeLevl1AdBanner extends StatelessWidget {
  const HomeLevl1AdBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: GlobalPref.of(context).width - 30,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/home/ad1-2.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey[100],
              blurRadius: 6,
            )
          ]),
    );
  }
}

class HomeLevl2AdBanner extends StatelessWidget {
  const HomeLevl2AdBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: AssetImage(
                'assets/img/home/97ee0d2cc04fac5318a3997c32ed3c66.jpg'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey[100],
              blurRadius: 2,
            ),
          ]),
    );
  }
}

class BrokerCircle extends StatelessWidget {
  const BrokerCircle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'BROKER CIRCLE',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              Text(
                'SEE WHAT THEY SELL',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
              )
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          //to be changed
          Container(
            child: Image(
              image: AssetImage('assets/img/home/1.png'),
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

class StandardGridItemCard extends StatelessWidget {
  const StandardGridItemCard({
    Key key,
    this.prodItemPortaitCard,
  }) : super(key: key);

  final ProdItemPortaitCard prodItemPortaitCard;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: Colors.grey[300],
            blurRadius: 6,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(prodItemPortaitCard.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              prodItemPortaitCard.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              '\$${prodItemPortaitCard.price.toString()}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewArrivalContainer extends StatelessWidget {
  const NewArrivalContainer({
    Key key,
    this.imgPath,
  }) : super(key: key);

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: Image(
        image: AssetImage(imgPath),
      ),
    );
  }
}

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

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Row(
          children: [
            Text(
              'ALIZII',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Container(
              width: GlobalPref.of(context).width * .6,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                style: TextStyle(fontSize: 14.0),
                onChanged: (value) => print(value),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 15.0,
                  ),
                  suffixIconConstraints: BoxConstraints(minHeight: 30),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'La vie en rose',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.qr_code_scanner_rounded),
                  ),
                ),
                cursorColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderCategoryBar extends StatefulWidget {
  @override
  _HeaderCategoryBarState createState() => _HeaderCategoryBarState();
}

class _HeaderCategoryBarState extends State<HeaderCategoryBar> {
  List<String> categories = [
    'HOT',
    'FRESH',
    'FOOD',
    'ELECTRONIC',
    'WOMEN',
    'MEN',
    'AUTOMOTIVE',
    'SPORT',
    'GIFT',
    'MEDICAL'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      height: 30.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (__, int index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
              top: 8.0,
            ),
            child: Column(
              children: [
                Text(
                  categories[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: selectedIndex == index
                        ? Colors.white
                        : Color(0x9CFFFFFF).withOpacity(.8),
                  ),
                ),
                Container(
                  height: 2.0,
                  width: 15.0,
                  color: selectedIndex == index
                      ? Colors.white
                      : Colors.transparent,
                  padding: EdgeInsets.symmetric(
                    vertical: 3.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*
GridView.builder(
                        padding: EdgeInsets.all(0.0),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: imageList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.red,
                          ),
                          child: Container(
                            color: Colors.red,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Image.network(
                                      'https://picsum.photos/seed/image001/500/500',
                                      fit: BoxFit.fitWidth),
                                ),
                                Text('Title'),
                                Text(
                                  '\$199.99',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),


*/
