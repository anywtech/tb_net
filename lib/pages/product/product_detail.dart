import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/models/product/proddetail.dart' as prodModel;
import 'package:tb_net/utils/global_pref.dart';
import 'package:tb_net/utils/home_standard_gridview.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetail extends StatelessWidget {
  final prodModel.ProductDetail productDetail;

  const ProductDetail({Key key, this.productDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.network(
                  item,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 15.0,
                  right: 15.0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey.withOpacity(.5),
                          Colors.black.withOpacity(.5),
                          Colors.grey.withOpacity(.5),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(
                      '${imgList.indexOf(item)}/${imgList.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  child: CarouselSlider(
                    items: imageSliders,
                    options: CarouselOptions(
                      height: GlobalPref.of(context).height * .4,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 30),
                      // aspectRatio: 1,
                      enlargeCenterPage: false,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'fresh kent mango (9Lb)',
                        style: TextStyle(
                          color: Color(0x9C222F3E),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'fresh kent mango',
                        style: TextStyle(
                          color: Color(0x9C8395A7),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.orange, width: 0),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Text(
                              'Special Offer',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                          Text(
                            '\$18.99',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5.0),
                            width: 35,
                            child: Image(
                              image: AssetImage('assets/img/home/costco.png'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Text(
                            'COSTCO',
                            style: TextStyle(fontSize: 12.0),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 2, left: 5, right: 5),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              child: Text(
                                'VIEW',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w800,
                                  backgroundColor: Colors.orange,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Products:',
                            style: TextStyle(
                                color: Color(0x9C8395A7), fontSize: 12.0),
                          ),
                          TextSpan(
                            text: '100  ',
                            style: TextStyle(
                                color: Colors.black87, fontSize: 12.0),
                          ),
                          TextSpan(
                            text: 'Sales:',
                            style: TextStyle(
                                color: Color(0x9C8395A7), fontSize: 12.0),
                          ),
                          TextSpan(
                            text: '10K+  ',
                            style: TextStyle(
                                color: Colors.black87, fontSize: 12.0),
                          ),
                          TextSpan(
                            text: 'Business Index:',
                            style: TextStyle(
                                color: Color(0x9C8395A7), fontSize: 12.0),
                          ),
                          TextSpan(
                            text: '10  ',
                            style: TextStyle(
                                color: Colors.black87, fontSize: 12.0),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          {
                            'tag': 'Consistance',
                            'note': '5.0',
                            'noteColor': Colors.green
                          },
                          {
                            'tag': 'Delivery',
                            'note': '5.0',
                            'noteColor': Colors.orange
                          },
                          {
                            'tag': 'Services',
                            'note': '5.0',
                            'noteColor': Colors.blue
                          }
                        ]
                            .map(
                              (e) => RemarkOfStore(
                                tag: e['tag'],
                                note: e['note'],
                                noteColor: e['noteColor'],
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      StoreFeaturedCol3StandardGrid(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.75,
                        prods: recommendedItems6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TransparentAppBar(),
        ],
      ),
    );
  }
}

class RemarkOfStore extends StatelessWidget {
  const RemarkOfStore({
    this.tag,
    this.note,
    this.tagColor,
    this.noteColor,
    this.fontColor,
    Key key,
  }) : super(key: key);

  final String tag;
  final String note;
  final Color tagColor;
  final Color noteColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
          color: tagColor == null ? Colors.black : tagColor,
          child: Text(
            tag,
            style: TextStyle(
                color: fontColor == null ? Colors.white : fontColor,
                fontWeight: FontWeight.w500,
                fontSize: 10),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 8.0),
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
          color: noteColor == null ? Colors.black : noteColor,
          child: Text(
            note,
            style: TextStyle(
                color: fontColor == null ? Colors.white : fontColor,
                fontSize: 10),
          ),
        ),
      ],
    );
  }
}

class TransparentAppBar extends StatelessWidget {
  const TransparentAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            RoundTransButton(
              onTap: () {},
              icon: 'assets/icon/svg/md-arrow_back.svg',
            ),
            Spacer(),
            RoundTransButton(
              onTap: () {},
              icon: 'assets/icon/svg/md-headset_mic.svg',
            ),
            const SizedBox(
              width: 5.0,
            ),
            RoundTransButton(
              onTap: () {},
              icon: 'assets/icon/svg/md-headset_mic.svg',
            ),
            const SizedBox(
              width: 5.0,
            ),
            RoundTransButton(
              onTap: () {},
              icon: 'assets/icon/svg/md-share.svg',
            ),
          ],
        ),
      ),
    );
  }
}

class RoundTransButton extends StatelessWidget {
  const RoundTransButton({
    Key key,
    this.icon,
    this.onTap,
  }) : super(key: key);
  final String icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.grey[300].withOpacity(.5),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
