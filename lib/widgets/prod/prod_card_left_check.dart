import 'package:flutter/material.dart';
import 'package:tb_net/models/proditemcard_in_cart.dart';
import 'package:tb_net/widgets/prod/button_add_rem.dart';
import 'package:tb_net/widgets/prod/custom_checker.dart';
import 'package:tb_net/widgets/prod/sku_richetext.dart';

class ProdCartLeftCheck extends StatelessWidget {
  const ProdCartLeftCheck({
    Key key,
    this.prodCardInCart,
  }) : super(key: key);

  final ProdItemCardInCart prodCardInCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0, right: 15.0, left: 15.0),
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
                  image: NetworkImage(prodCardInCart.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prodCardInCart.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  prodCardInCart.desc,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Sourced by ${prodCardInCart.vnm}',
                  //if refid !="", sold by refname
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                Text(
                  '\$ ${prodCardInCart.prc}',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SKURicheText(
                  skus: prodCardInCart.sku,
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
                  isChecked: prodCardInCart.isChk,
                ),
                ButtonAddRem(
                  qty: prodCardInCart.qty,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
