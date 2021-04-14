import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouterPages.Cart),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Select All',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Column(children: <Widget>[
            ProdCartLeftCheck(),
          ]),
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 30.0,
              ),
              child: Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width * .35,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text('SELECTED 3')),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 10,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .3,
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$ 168.99',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Proceed',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonAddRem extends StatelessWidget {
  const ButtonAddRem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.orange,
                ),
              ),
              child: Text(
                '-',
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              height: 20.0,
              width: 40.0,
              child: Text('1')),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(
                  width: 1.0,
                  color: Colors.orange,
                ),
              ),
              child: Container(
                child: Text(
                  '+',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProdCartLeftCheck extends StatelessWidget {
  const ProdCartLeftCheck({
    Key key,
    this.prodCardInCart,
  }) : super(key: key);

  final List<Map> prodCardInCart;

  /* {"pid":"10001", "image":"", "name":"", "desc":"", "vid":"",
   "vnm":"","prc":10.99, "isChk":true,"sid":"","sku":{"name":"","val":""},"qty":10, "inStock":10}
    */

  @override
  Widget build(BuildContext context) {
    final skus = [
      {"name": "Color", "val": "Red"},
      {"name": "Model", "val": "XX 88 fl h lksjdfk s"},
      {"name": "Set", "val": "asdfadfk s"}
    ];

    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey[200],
          spreadRadius: 0,
          blurRadius: 7,
          offset: Offset(0, 5), // changes position of shadow
        ),
      ]),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
            leading: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.orange,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://img.freepik.com/free-vector/air-travel-logo_1284-753.jpg?size=338&ext=jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'name',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  'description',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Sourced by COSTCO',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                Text(
                  '\$ 10.99',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SKURicheText(
                  skus: skus,
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.orange[100].withOpacity(.5),
            height: 15.0,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomChecker(
                  onTap: () {},
                  isChecked: false,
                ),
                ButtonAddRem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SKURicheText extends StatelessWidget {
  const SKURicheText({
    Key key,
    this.skus,
  }) : super(key: key);

  final List<Map> skus;

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
              ...e.entries
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

class CustomChecker extends StatelessWidget {
  const CustomChecker({
    Key key,
    this.height,
    this.width,
    this.isChecked,
    this.onTap,
    this.iconSize,
  }) : super(key: key);

  final double height;
  final double width;
  final double iconSize;
  final bool isChecked;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isChecked
          ? Container(
              alignment: Alignment.bottomLeft,
              height: height == null ? 20.0 : height,
              width: width == null ? 20.0 : width,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Icon(
                Icons.check,
                size: iconSize == null ? 14.0 : iconSize,
                color: Colors.white,
              ),
            )
          : Container(
              alignment: Alignment.bottomLeft,
              height: height == null ? 20.0 : height,
              width: width == null ? 20.0 : width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Icon(
                Icons.check,
                size: iconSize == null ? 14.0 : iconSize,
                color: Colors.grey[400],
              ),
            ),
    );
  }
}
