import 'package:meta/meta.dart';

//a: address, c: contact, p: phone, d:default

class Address {
  Address({
    @required this.a,
    @required this.c,
    @required this.p,
    @required this.d,
  });

  final String a;
  final String c;
  final String p;
  final bool d;

  Address copyWith({
    String a,
    String c,
    String p,
    bool d,
  }) =>
      Address(
        a: a ?? this.a,
        c: c ?? this.c,
        p: p ?? this.p,
        d: d ?? this.d,
      );

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        a: json["a"],
        c: json["c"],
        p: json["p"],
        d: json["d"],
      );

  Map<String, dynamic> toMap() => {
        "a": a,
        "c": c,
        "p": p,
        "d": d,
      };
}
