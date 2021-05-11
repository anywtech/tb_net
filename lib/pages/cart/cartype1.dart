import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/prod/sku_buy_modal.dart';

//buy now
class CartType1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Stack(children: [
        SkuBuyModal(),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: PaymentButton2Parts(),
        )
      ]),
    );
  }
}

class PaymentButton2Parts extends StatelessWidget {
  const PaymentButton2Parts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    bottomLeft: Radius.circular(35.0),
                  ),
                ),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Total: \$99.99\n',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: 'incl. deliver: \$1.99  ',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    TextSpan(
                      text: 'tax: \$15.99',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ]),
                )),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .popAndPushNamed(RouterPages.PaymentResult);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35.0),
                    bottomRight: Radius.circular(35.0),
                  ),
                ),
                child: Text(
                  'PAY',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
