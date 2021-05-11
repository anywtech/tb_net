import 'package:flutter/material.dart';
import 'package:tb_net/models/product/proddetail.dart';

class ProdSKUModal extends StatelessWidget {
  final Skus skus;

  const ProdSKUModal({Key key, this.skus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.width / 5 + 20,
            left: 15,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6 -
                  MediaQuery.of(context).size.width * 0.2 -
                  60,
              width: MediaQuery.of(context).size.width - 30,
              //color: Colors.blue,
              child: SingleChildScrollView(
                child: Wrap(children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Attribute',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Wrap(children: []),
                ]),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.6 - 54,
            left: 0.0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 54,
                child: Text(
                  'Proceed',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
          Positioned(
            top: -25,
            left: 15,
            child: Container(
              width: MediaQuery.of(context).size.width / 5 + 15,
              height: MediaQuery.of(context).size.width / 5 + 15,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width / 5 + 5,
            left: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey,
            ),
          ),
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width / 5 + 38,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 8.0),
                  child: Text(
                    '\$100.00 - \$200.00',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w800),
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 3.0),
                  width: MediaQuery.of(context).size.width * 0.8 - 53,
                  child: Text(
                    'Price will be changed after selling 100',
                    style: TextStyle(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8 - 53,
                  child: Text('select '
                      /*   skuvm.noSltMsg == ""
                        ? (skuvm.sltdMsg == ""
                            ? 'Please select: ' + skuvm.allAtts
                            : 'Slected: ' + skuvm.sltdMsg)
                        : 'Please select: ' + skuvm.noSltMsg,
                    style: TextStyle(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, */
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
