import 'package:flutter/material.dart';
import 'package:tb_net/models/order/order_overview.dart';
import 'package:tb_net/widgets/common/custom_button.dart';

class OrderSimpleCard extends StatelessWidget {
  const OrderSimpleCard({
    Key key,
    this.order,
  }) : super(key: key);

  final OrderOverview order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 10.0,
      ),
      margin: const EdgeInsets.only(bottom: 5.0),
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                //color: Colors.orange,
                image: DecorationImage(
                  image: NetworkImage(order.prdsOv[0].pimg),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Text(
              order.prdsOv[0].pnm,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              order.prdsOv[0].pdesc,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  order.pDate.toString(),
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
          ),
        ],
      ),
    );
  }
}
