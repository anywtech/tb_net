import 'package:meta/meta.dart';

class WalletCards {
  WalletCards({
    @required this.l,
    @required this.e,
    @required this.p,
    @required this.t,
    @required this.d,
  });

//l: last4, e : expired, p : phone, t:type(VISA, MASTER,AMEX)
  final String l;
  final String e;
  final String p;
  final String t;
  bool d;

  WalletCards copyWith({
    String l,
    String e,
    String p,
    String t,
    bool d,
  }) =>
      WalletCards(
        l: l ?? this.l,
        e: e ?? this.e,
        p: p ?? this.p,
        t: t ?? this.t,
        d: d ?? this.d,
      );

  factory WalletCards.fromMap(Map<String, dynamic> json) => WalletCards(
        l: json["l"],
        e: json["e"],
        p: json["p"],
        t: json["t"],
        d: json["d"],
      );

  Map<String, dynamic> toMap() => {
        "l": l,
        "e": e,
        "p": p,
        "t": t,
        "d": d,
      };
}
