import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tb_net/models/image_data.dart';
import 'package:tb_net/models/order/comment.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/models/product/proddetail.dart' as prodModel;
import 'package:tb_net/models/product/proddetail.dart';
import 'package:tb_net/utils/global_pref.dart';
import 'package:tb_net/utils/home_standard_gridview.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/footer.dart';
import 'package:tb_net/widgets/prod/prod_sku_modal.dart';
import 'package:tb_net/widgets/prod/sku_buy_modal.dart';
import 'package:tb_net/widgets/rec_staggered_view.dart';

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
                      '${imgList.indexOf(item) + 1}/${imgList.length}',
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
                        'Fresh kent mango (9Lb) Fresh kent mango (9Lb)Fresh kent mango (9Lb)Fresh kent mango (9Lb)',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        'fresh kent mangofresh kent mangofresh kent mangofresh kent mangofresh kent mango',
                        style: TextStyle(
                          color: Color(0x9C8395A7),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                                fontSize: 8,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\$18.99',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '\$198.99',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
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
                CommentContainer(),
                const SizedBox(
                  height: 5.0,
                ),
                StorePartInProdDetail(),
                const SizedBox(
                  height: 5.0,
                ),
                ProdDetailsListImage(),
                const SizedBox(
                  height: 5.0,
                ),
                RecommendationStaggeredView(),
                const SizedBox(
                  height: 5.0,
                ),
                Footer(
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
          TransparentAppBar(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 15.0),
        height: 50,
        color: Colors.white,
        child: Row(
          children: [
            CustomButtonType3(
              icon: Icons.storefront_outlined,
              desc: 'Store',
            ),
            CustomDivider(),
            CustomButtonType3(
              icon: Icons.favorite_border,
              desc: 'Wish',
            ),
            CustomDivider(),
            CustomButtonType3(
              icon: Icons.headset_outlined,
              desc: 'Support',
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
                child: GestureDetector(
              onTap: () {
                _SKUModal(
                  context,
                  new prodModel.Skus(
                      sku: "sku",
                      color: "color",
                      model: "model",
                      skusSet: "skusSet",
                      prc: 1.11,
                      stk: 100),
                );
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.orange,
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(RouterPages.CartType1);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _SKUModal(context, Skus skus) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext buildContext) {
          return ProdSKUModal(skus: skus);
        });
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7.0,
        vertical: 8.0,
      ),
      width: 15.0,
      child: Container(
        color: Colors.grey[200],
      ),
    );
  }
}

class CustomButtonType3 extends StatelessWidget {
  const CustomButtonType3({
    Key key,
    this.icon,
    this.desc,
  }) : super(key: key);

  final IconData icon;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        Text(
          desc,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class ProdDetailsListImage extends StatelessWidget {
  const ProdDetailsListImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Text(
            'Product Detail',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ...imageList
            .map(
              (e) => Image(
                image: NetworkImage(e.imageUrl),
                fit: BoxFit.fitWidth,
              ),
            )
            .toList(),
      ],
    );
  }
}

class CommentContainer extends StatelessWidget {
  const CommentContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowTitle(
              name: 'COMMENT',
              textStyle: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
              ),
              actionName: 'MORE',
              onTap: () {}),
          const SizedBox(
            height: 15.0,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              'Nice',
              'Good quality Good quality Good quality',
              'Comfort',
              'Would buy',
              'Nice',
              'Good quality Good quality Good quality',
              'Comfort',
              'Would buy',
              'Nice',
              'Good quality Good quality Good quality',
              'Comfort',
              'Would buy'
            ]
                .map(
                  (e) => CommentTag(
                    name: e.length > 20 ? e.substring(0, 20) : e,
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 15.0,
          ),
          ...comments
              .map(
                (e) => CommentCard(
                  comment: e,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({
    this.comment,
    Key key,
  }) : super(key: key);
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: NetworkImage(comment.userIcon),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                comment.userName,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Spacer(),
              Text(
                comment.commentDate,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            comment.comments,
            style: TextStyle(
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          comment.replyDate != ""
              ? Container(
                  color: Colors.grey[50],
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'HostReply:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '2021-05-01',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        comment.replies,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class CommentTag extends StatelessWidget {
  const CommentTag({
    Key key,
    this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.orange[200],
      Colors.orange[50],
      Colors.orange[100],
    ];

    Color color = colors[new Random().nextInt(3)];
    return Container(
      margin: EdgeInsets.only(
        right: 8,
        bottom: 5,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          2.0,
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 10.0,
        ),
      ),
    );
  }
}

class StorePartInProdDetail extends StatelessWidget {
  const StorePartInProdDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowTitle(
              logo: "logo", name: 'COSTCO', actionName: 'VIEW', onTap: () {}),
          const SizedBox(
            height: 5.0,
          ),
          RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(children: [
              TextSpan(
                text: 'Products:',
                style: TextStyle(color: Color(0x9C8395A7), fontSize: 12.0),
              ),
              TextSpan(
                text: '100  ',
                style: TextStyle(color: Colors.black87, fontSize: 12.0),
              ),
              TextSpan(
                text: 'Sales:',
                style: TextStyle(color: Color(0x9C8395A7), fontSize: 12.0),
              ),
              TextSpan(
                text: '10K+  ',
                style: TextStyle(color: Colors.black87, fontSize: 12.0),
              ),
              TextSpan(
                text: 'Business Index:',
                style: TextStyle(color: Color(0x9C8395A7), fontSize: 12.0),
              ),
              TextSpan(
                text: '10  ',
                style: TextStyle(color: Colors.black87, fontSize: 12.0),
              ),
            ]),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              {'tag': 'Consistance', 'note': '5.0', 'noteColor': Colors.green},
              {'tag': 'Delivery', 'note': '5.0', 'noteColor': Colors.orange},
              {'tag': 'Services', 'note': '5.0', 'noteColor': Colors.blue}
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
    );
  }
}

class RowTitle extends StatelessWidget {
  const RowTitle({
    Key key,
    this.logo,
    this.name,
    this.actionName,
    this.onTap,
    this.textStyle,
  }) : super(key: key);

  final String logo;
  final String name;
  final TextStyle textStyle;
  final String actionName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        logo == null
            ? Container()
            : Container(
                margin: EdgeInsets.only(right: 5.0),
                width: 35,
                child: Image(
                  image: AssetImage(
                      'assets/img/home/costco.png'), // networkimage(logo)
                  fit: BoxFit.fitWidth,
                ),
              ),
        Text(
          name,
          style: textStyle == null ? TextStyle(fontSize: 12.0) : textStyle,
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Text(
              actionName,
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
              onTap: () {
                Navigator.of(context).pop();
              },
              icon: 'assets/icon/svg/md-arrow_back.svg',
            ),
            Spacer(),
            RoundTransButton(
              onTap: () {},
              icon: 'assets/icon/svg/dollar.svg',
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
        width: 25,
        height: 25.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Colors.grey[800].withOpacity(.5),
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
