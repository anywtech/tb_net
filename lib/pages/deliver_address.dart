import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tb_net/models/address.dart';
import 'package:tb_net/utils/form_dialogue.dart';
import 'package:tb_net/widgets/address/address_form.dart';
import 'package:tb_net/widgets/delete_confirm_dialogue.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/address/address_card.dart';
import 'package:tb_net/widgets/input_text.dart';

class DelieverAddress extends StatelessWidget {
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
          child: Stack(
            children: [
              ListView.builder(
                physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                itemCount: addrItems.length + 1,
                itemBuilder: (_, int index) => index == addrItems.length
                    ? Container(
                        height: 100,
                      )
                    : Slidable(
                        key: Key(index.toString()),
                        child: AddressCard(address: addrItems[index]),
                        dismissal: SlidableDismissal(
                          child: SlidableDrawerDismissal(),
                          onWillDismiss: (actionType) {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return DeleteConfirmDialog(
                                  cancleEvent: () =>
                                      Navigator.of(context).pop(false),
                                  okEvent: () =>
                                      Navigator.of(context).pop(true),
                                );
                              },
                            );
                          },
                          onDismissed: (actionType) {
                            /*   setState(() {
                          addrItems.remove(addr);
                        }); */
                          },
                        ),
                        actionPane: SlidableBehindActionPane(),
                        actionExtentRatio: 1 / 4,
                        secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Edit',
                              color: Colors.grey.shade200,
                              icon: Icons.edit,
                              onTap: () => FormDialogue.show(
                                context,
                                AddressForm(),
                              ), //_showSnackBar(context, 'Edit'),
                            ),
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: () => showDialog(
                                context: context,
                                builder: (context) {
                                  return DeleteConfirmDialog(
                                    cancleEvent: () =>
                                        Navigator.of(context).pop(false),
                                    okEvent: () =>
                                        Navigator.of(context).pop(true),
                                  );
                                },
                              ),
                            ),
                          ]),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.orange,
                  ),
                  child: TextButton(
                    onPressed: () {
                      FormDialogue.show(
                        context,
                        AddressForm(),
                      );
                    },
                    child: Text(
                      'NEW ADDRESS',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
