import 'package:flutter/material.dart';
import 'package:tb_net/models/order/order_overview.dart';
import 'package:tb_net/widgets/footer.dart';
import 'package:tb_net/widgets/order/order_multi_items_card.dart';
import 'package:tb_net/widgets/order/order_simple_card.dart';
import 'package:tb_net/widgets/rec_staggered_view.dart';

class OrderTabView extends StatelessWidget {
  const OrderTabView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ...orderList
              .map(
                (o) => o.prdsOv.length > 1
                    ? OrderMultiItemsCard(
                        order: o,
                      )
                    : OrderSimpleCard(
                        order: o,
                      ),
              )
              .toList(),
          RecommendationStaggeredView(),
          Footer(),
        ],
      ),
    );
  }
}
