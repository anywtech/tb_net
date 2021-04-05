import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_net/models/wallet_cards.dart';
import 'package:tb_net/providers/wallet.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/bank_card.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WallletProvider>(
      create: (_) => WallletProvider(),
      child: Scaffold(
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
            child: Consumer<WallletProvider>(
              builder: (__, wallet, _) => Stack(
                children: [
                  wallet.cardItems.length == 0
                      ? Center(
                          child: Icon(
                            Icons.credit_card,
                            size: 30,
                          ),
                        )
                      : ListView.separated(
                          physics: AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          itemCount: wallet.cardItems.length + 1,
                          itemBuilder: (_, int index) => index ==
                                  wallet.cardItems.length
                              ? Container(
                                  height: 100,
                                )
                              : BankCard(
                                  cardItems: wallet.cardItems[index],
                                  setEvent: () => wallet
                                      .reverseDefault(wallet.cardItems[index]),
                                  delEvent: () =>
                                      wallet.delCard(wallet.cardItems[index]),
                                ),
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },
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
                          print('add the card');
                        },
                        child: Text(
                          'ADD BANK CARD',
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
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
