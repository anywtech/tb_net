import 'package:flutter/material.dart';
import 'package:tb_net/utils/global_pref.dart';
import 'package:tb_net/widgets/footer.dart';
import 'package:tb_net/widgets/prod/button_add_rem.dart';

class SkuBuyModal extends StatelessWidget {
  //final ProductDetail prod;

  const SkuBuyModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          CartRowTile(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            leading: Icons.location_on_outlined,
            title: 'Add the address or existed address',
            trailing: Icon(
              Icons.chevron_right_outlined,
              size: 14,
            ),
          ),
          Container(
            height: 1,
            width: GlobalPref.of(context).width,
            child: Image(
              image: AssetImage(
                'assets/img/cart/horizontaldivider.png',
              ),
              repeat: ImageRepeat.repeatX,
            ),
          ),
          CartRowTile(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            leading: Icons.calendar_view_day_sharp,
            title: 'Payment or card number or social pay',
            trailing: Icon(
              Icons.chevron_right_outlined,
              size: 14,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              color: Colors.white,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: GlobalPref.of(context).width * .2,
                            width: GlobalPref.of(context).width * .2,
                            margin: const EdgeInsets.only(right: 15.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[100],
                                  offset: Offset(0, 5),
                                  blurRadius: 7,
                                )
                              ],
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://www.thesun.co.uk/wp-content/uploads/2018/07/NINTCHDBPICT000422806102-e1532532119175.jpg'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$2.99 - 9.99',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Please select: Color Model',
                                  style: TextStyle(fontSize: 12.0),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                ButtonAddRem(
                                  qty: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Wrap(
                        children: [
                          Container(
                            width: GlobalPref.of(context).width - 30,
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: Text('Colors'),
                          ),
                          Wrap(
                            children: [
                              CustomSkuChip(),
                              CustomSkuChip(),
                              CustomSkuChip(),
                              CustomSkuChip(),
                              CustomSkuChip(),
                            ],
                          ),
                          Container(
                            width: GlobalPref.of(context).width - 30,
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: Text('Colors'),
                          ),
                          Wrap(
                            children: [
                              CustomSkuChip(),
                              CustomSkuChip(),
                              CustomSkuChip(),
                              CustomSkuChip(),
                              CustomSkuChip(),
                            ],
                          ),
                          Container(
                            width: GlobalPref.of(context).width - 30,
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: Text('Colors'),
                          ),
                          Wrap(
                            children: [
                              CustomSkuChip(),
                              CustomSkuChip(),
                              CustomSkuChip(),
                              CustomSkuChip(),
                              CustomSkuChip(),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      CartRowTile(
                        leading: Icons.delivery_dining,
                        title: 'I will pick up myself',
                        trailing: Icon(Icons.check_box_outline_blank),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          '7805 Laussane,, Canada, 7805 Laussane, Brossard, J4Y0J4, QC, Canada,7805 Laussane, Brossard, J4Y0J4, QC, Canada,7805 Laussane, Brossard, J4Y0J4, QC, Canada',
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Footer(),
                      //recommendation
                    ],
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

class CartRowTile extends StatelessWidget {
  const CartRowTile({
    Key key,
    this.padding,
    this.leading,
    this.title,
    this.trailing,
    this.rowPadding,
  }) : super(key: key);

  final EdgeInsetsGeometry padding;
  final IconData leading;
  final String title;
  final Widget trailing;
  final EdgeInsetsGeometry rowPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: padding == null
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Padding(
            padding: rowPadding == null
                ? const EdgeInsets.only(right: 10.0, top: 15, bottom: 15.0)
                : rowPadding,
            child: Icon(leading),
          ),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: trailing,
          ),
        ],
      ),
    );
  }
}

class CustomSkuChip extends StatelessWidget {
  const CustomSkuChip({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Text(
        'Red asdfew s sd ',
        style: TextStyle(fontSize: 12.0),
      ),
    );
  }
}
