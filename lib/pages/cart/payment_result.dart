import 'package:flutter/material.dart';
import 'package:tb_net/utils/global_pref.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/footer.dart';
import 'package:tb_net/widgets/rec_staggered_view.dart';

class PaymentResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: GlobalPref.of(context).height * .3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.orange[200],
                      Colors.orange[400],
                      Colors.orange[500],
                    ]),
              ),
            ),
            AppBar(
              leading: GestureDetector(
                child: Icon(Icons.close),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text('Payment result'),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            Container(
              width: GlobalPref.of(context).width - 30,
              height: GlobalPref.of(context).height * .2,
              margin: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: GlobalPref.of(context).height * .2,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      offset: Offset(0, 5),
                      blurRadius: 7,
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Paid successfully',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                    child: Text(
                      'Your order will be confirmed by seller.',
                      style: TextStyle(
                        color: Color(0x9C8395A7),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).popAndPushNamed(RouterPages.Orders);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange.withOpacity(.5),
                          width: 0,
                        ),
                      ),
                      child: Text(
                        'CHECK ORDER',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontSize: 12.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: GlobalPref.of(context).width * .15,
                height: GlobalPref.of(context).width * .15,
                margin: EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: GlobalPref.of(context).height * .2 -
                      GlobalPref.of(context).width * .075,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.check,
                  color: Color(0x9C0DD1AA),
                  size: 36,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: GlobalPref.of(context).height * .4 + 15.0,
              ),
              child: Column(
                children: [RecommendationStaggeredView(), Footer()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
