import 'package:flutter/material.dart';
import 'package:tb_net/pages/edit_address.dart';
import 'package:tb_net/widgets/common/custom_button.dart';
import 'package:tb_net/widgets/footer.dart';
import 'package:tb_net/widgets/order/order_simple_card.dart';
import 'package:tb_net/widgets/rec_staggered_view.dart';

class OrderTabView extends StatelessWidget {
  const OrderTabView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* return ListView.builder(
      primary: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 0.0),
      itemBuilder: (_, int index) => index == 6
          ? RecommendationStaggeredView()
          : index == 7
              ? Footer()
              : index == 3
                  ? OrderMultiItemsCard()
                  : OrderSimpleCard(),
      itemCount: 8,
    ); */
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          OrderMultiItemsCard(),
          OrderSimpleCard(),
          RecommendationStaggeredView(),
          Footer(),
        ],
      ),
    );
  }
}

class OrderMultiItemsCard extends StatelessWidget {
  const OrderMultiItemsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 15.0,
      ),
      margin: const EdgeInsets.only(bottom: 5.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [1, 2, 4, 5, 6, 7, 8, 9, 10]
                  .map(
                    (e) => OrderVerticalCard(),
                  )
                  .toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 20.0,
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

class OrderVerticalCard extends StatelessWidget {
  const OrderVerticalCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 65.0,
      padding: EdgeInsets.only(
        left: 15.0,
      ),
      //color: Colors.red,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
              color: Colors.orange,
              image: DecorationImage(
                image: NetworkImage(
                    'https://secure.img1-fg.wfcdn.com/im/37935081/resize-h800%5Ecompr-r85/8985/89852875/Mangosteen+Purple+Area+Rug.jpg'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            width: 50.0,
            // color: Colors.white,
            child: Text(
              'descr idescr itpi onst pionde sc ritpi on ssdes critpi ons',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.orange,
              ),
            ),
          )
        ],
      ),
    );
  }
}
