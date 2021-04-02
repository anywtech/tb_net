import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tb_net/models/address.dart';
import 'package:tb_net/utils/routers.dart';

class DelieverAddress extends StatefulWidget {
  @override
  _DelieverAddressState createState() => _DelieverAddressState();
}

class _DelieverAddressState extends State<DelieverAddress> {
  final List<Address> addrItems = List.generate(
    10,
    (i) => Address(
        a: "addres saddr esadd re$i ssadd resa ddre ssadd$i resaddres saddresa ddressaddres $i",
        c: "Williams Williams ms",
        p: "+8867 12345671189 $i",
        d: i == 9 ? true : false),
  );

  @override
  Widget build(BuildContext context) {
    addrItems.sort((a, b) {
      if (b.d) {
        return 1;
      }
      return -1;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(RouterPages.DelieverAddress),
        backgroundColor: Colors.white,
        elevation: 8,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 80,
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: addrItems.map((addr) {
              return Slidable(
                  key: Key(addr.p),
                  child: VerticalAddressCard(address: addr),
                  dismissal: SlidableDismissal(
                    child: SlidableDrawerDismissal(),
                    onWillDismiss: (actionType) {
                      return showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Delete'),
                            content: Text('Item will be deleted'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                              ),
                              TextButton(
                                child: Text('Ok'),
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onDismissed: (actionType) {
                      setState(() {
                        addrItems.remove(addr);
                      });
                    },
                  ),
                  actionPane: SlidableBehindActionPane(),
                  actionExtentRatio: 1 / 4,
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Edit',
                      color: Colors.grey.shade200,
                      icon: Icons.edit,
                      onTap: () => _showSnackBar(context, 'Edit'),
                    ),
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () => showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Delete'),
                            content: Text('Item will be deleted'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                              ),
                              TextButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                    setState(() {
                                      addrItems.remove(addr);
                                    });
                                    _showSnackBar(context, 'Delete');
                                  }),
                            ],
                          );
                        },
                      ),
                    ),
                  ]);
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}

class VerticalAddressCard extends StatelessWidget {
  VerticalAddressCard({this.address});
  final Address address;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Slidable.of(context)?.renderingMode == SlidableRenderingMode.none
            ? Slidable.of(context)?.open(actionType: SlideActionType.secondary)
            : Slidable.of(context)?.close();
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
