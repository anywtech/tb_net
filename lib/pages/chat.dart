import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tb_net/models/image_data.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/utils/global_pref.dart';
import 'package:tb_net/utils/gridview_layouts.dart';
import 'package:tb_net/widgets/rec_staggered_view.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 110 + GlobalPref.of(context).height * .1,
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
                    Container(
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
                              blurRadius: 2,
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    //collabration sales
                    Container(
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'Time limit sales : ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '10:19:01',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TimeLimitedCard(
                                        price: 9.99,
                                        marketPrice: 199.99,
                                        imgPath:
                                            'assets/img/home/01-blue-t-shirt.png',
                                      ),
                                      TimeLimitedCard(
                                        price: 9.99,
                                        marketPrice: 199.99,
                                        imgPath:
                                            'assets/img/home/3bd6ba24fc8e816eb5c678d0cc4ec1e2.png',
                                      ),
                                      TimeLimitedCard(
                                        price: 9.99,
                                        marketPrice: 199.99,
                                        imgPath:
                                            'assets/img/home/12-mi-music.png',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'SPECIAL OFFER',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TimeLimitedCard(
                                        price: 9.99,
                                        marketPrice: 199.99,
                                        imgPath:
                                            'assets/img/home/367d043a8dab477bd5bdf9ea862bbd0d.png',
                                      ),
                                      TimeLimitedCard(
                                        price: 9.99,
                                        marketPrice: 199.99,
                                        imgPath:
                                            'assets/img/home/602d9df90edb6a81219b2847face67b6.png',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'HOT SALE',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  HomePromotionCardHorizontal(
                                    imgPath:
                                        'assets/img/home/602d9df90edb6a81219b2847face67b6.png',
                                    title: 'AI Pet Bowl',
                                    price: 99.99,
                                  ),
                                  HomePromotionCardHorizontal(
                                    imgPath:
                                        'assets/img/home/919e6d1fda4c61fedbb35ea7aec3f61f.png',
                                    title: 'Balance Car',
                                    price: 1999.99,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'NEW ARRIVAL',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
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
                                          ]),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //level2 adv
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
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
                    ),

                    const SizedBox(
                      height: 15.0,
                    ),

                    //broker ranking
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10.0),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                              Text(
                                'SEE WHAT THEY SELL',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
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
                    ),

                    // products 2 cols
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
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
                      child: StandardGrid(
                        widget: StandardGridItemCard(),
                      ),
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
            color: Colors.grey[200],
            blurRadius: 4,
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
            child: Text(prodItemPortaitCard.name),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              '\$${prodItemPortaitCard.price.toString()}',
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
  }) : super(key: key);

  final double price;
  final double marketPrice;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 56.0,
          width: 56.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgPath),
              fit: BoxFit.fill,
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
    'WOMENs',
    'MENs',
    'AUTOMOTIVE',
    'SPORTs',
    'GIFTs',
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
