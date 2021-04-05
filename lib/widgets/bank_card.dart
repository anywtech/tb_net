import 'package:flutter/material.dart';
import 'package:tb_net/models/wallet_cards.dart';

class BankCard extends StatelessWidget {
  const BankCard({
    Key key,
    @required this.cardItems,
    @required this.delEvent,
    @required this.setEvent,
  }) : super(key: key);

  final WalletCards cardItems;
  final Function delEvent;
  final Function setEvent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 8,
        shadowColor: Colors.grey[100].withOpacity(.5),
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            children: [
              Icon(Icons.credit_card),
              Text('**** **** **** ${cardItems.l}'),
              Text(cardItems.e),
              const Divider(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: setEvent,
                      child: cardItems.d
                          ? Row(
                              children: [
                                Icon(
                                  Icons.check_box_outlined,
                                  color: Colors.orange,
                                ),
                                Text(
                                  'Default Card',
                                  style: TextStyle(
                                      fontSize: 10,
                                      backgroundColor: Colors.orange),
                                )
                              ],
                            )
                          : Row(
                              children: [
                                Icon(
                                  Icons.check_box_outline_blank,
                                  color: Colors.grey[300],
                                ),
                                Text(
                                  'Set Default?',
                                  style: TextStyle(
                                      fontSize: 10,
                                      backgroundColor: Colors.grey[300]),
                                ),
                              ],
                            ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: delEvent,
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
