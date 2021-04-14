import 'package:flutter/material.dart';
import 'package:tb_net/models/proditemcard_in_cart.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/footer.dart';
import 'package:tb_net/widgets/prod/prod_card_left_check.dart';
import 'package:tb_net/widgets/rec_staggered_view.dart';

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
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Column(children: <Widget>[
            ...prodsInCart
                .map(
                  (p) => ProdCartLeftCheck(
                    prodCardInCart: p,
                  ),
                )
                .toList(),
            RecommendationStaggeredView(),
            Footer(),
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
