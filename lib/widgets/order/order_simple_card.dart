import 'package:flutter/material.dart';
import 'package:tb_net/widgets/common/custom_button.dart';

class OrderSimpleCard extends StatelessWidget {
  const OrderSimpleCard({
    Key key,
  }) : super(key: key);

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
                  color: Colors.orange,
                  image: DecorationImage(image: NetworkImage(''))),
            ),
            title: Text(
              'title title tlet ltle l',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text('Ordered on 2021-04-15'),
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
                  '1 item(s)',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12.0),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  '\$ 30.99',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Spacer(),
                CustomButton(
                  name: 'Review',
                  reversed: true,
                ),
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
          )
        ],
      ),
    );
  }
}
