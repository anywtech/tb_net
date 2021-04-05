import 'package:flutter/foundation.dart';
import 'package:tb_net/models/wallet_cards.dart';

class WallletProvider extends ChangeNotifier {
  List<WalletCards> _cardItems = List.generate(
    5,
    (i) => WalletCards(
        l: "1234 $i",
        e: "082080",
        p: "+8867 12345671189 $i",
        t: i / 2 == 0 ? "VISA" : "MASTER",
        d: i == 3 ? true : false),
  );

  List<WalletCards> get cardItems {
    _cardItems.sort((a, b) {
      if (b.d) {
        return 1;
      }
      return -1;
    });
    return _cardItems;
  }

  void reverseDefault(WalletCards card) {
    //var c = _cardItems.firstWhere((c) => c == card, orElse: () => null);

    _cardItems.forEach((cd) {
      if (cd == card) {
        cd.d = !cd.d;
      } else if (cd.d == true) {
        cd.d = !cd.d;
      }
    });

    notifyListeners();
  }

  void delCard(WalletCards card) {
    _cardItems.remove(card);
    notifyListeners();
  }
}
