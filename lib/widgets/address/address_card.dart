import 'package:flutter/material.dart';
import 'package:tb_net/models/address.dart';

class AddressCard extends StatelessWidget {
  AddressCard({this.address});
  final Address address;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*  Slidable.of(context)?.renderingMode == SlidableRenderingMode.none
            ? Slidable.of(context)?.open(actionType: SlideActionType.secondary)
            : Slidable.of(context)?.close(); */
      },
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 25.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                address.a,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                address.d
                    ? Text(
                        address.c.length > 12
                            ? address.c.substring(0, 12)
                            : address.c,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    : Text(
                        address.c.length > 22
                            ? address.c.substring(0, 22)
                            : address.c,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                Text(address.c.length > 12 ? '...  ' : '  '),
                Text(
                  address.p.length > 22
                      ? '${address.p.substring(0, 22)}...   '
                      : '${address.p}   ',
                  style: TextStyle(color: Colors.orange),
                ),
                address.d
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange, width: 1.0),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          'default',
                          style: TextStyle(color: Colors.orange, fontSize: 10),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
