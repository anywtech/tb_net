import 'package:flutter/material.dart';
import 'package:tb_net/models/order/order_overview.dart';
import 'package:tb_net/widgets/common/custom_button.dart';
import 'package:tb_net/widgets/common/vertical_image_card.dart';

class OrderMultiItemsCard extends StatelessWidget {
  const OrderMultiItemsCard({
    Key key,
    this.order,
  }) : super(key: key);

  final OrderOverview order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
      ),
      margin: const EdgeInsets.only(bottom: 5.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.5),
              child: Row(
                children: order.prdsOv
                    .map(
                      (e) => VerticalImageCard(
                        text: '${e.pnm} ${e.pdesc}',
                        image: e.pimg,
                        padding: 7.5,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          FooterOfOrderCard(order: order)
        ],
      ),
    );
  }
}

class FooterOfOrderCard extends StatelessWidget {
  const FooterOfOrderCard({
    Key key,
    @required this.order,
  }) : super(key: key);

  final OrderOverview order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            order.pDate,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            '${order.prdsOv.length.toString()} item(s)',
            style: TextStyle(color: Colors.grey[500], fontSize: 10.0),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            '\$ ${order.tlPrc.toString()}',
            style: TextStyle(
              color: Colors.red,
              fontSize: 10.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          const SizedBox(
            width: 5.0,
          ),
          CustomButton(
            name: 'Details',
            reversed: true,
          ),
          const SizedBox(
            width: 10.0,
          ),
          CustomButton(
            name: 'Buy Again',
            reversed: false,
          ),
        ],
      ),
    );
  }
}
