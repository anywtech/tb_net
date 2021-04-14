// To parse this JSON data, do
//
//     final prodItemCardInCart = prodItemCardInCartFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProdItemCardInCart prodItemCardInCartFromMap(String str) =>
    ProdItemCardInCart.fromMap(json.decode(str));

String prodItemCardInCartToMap(ProdItemCardInCart data) =>
    json.encode(data.toMap());

class ProdItemCardInCart {
  ProdItemCardInCart({
    @required this.pid,
    @required this.image,
    @required this.name,
    @required this.desc,
    @required this.vid,
    this.refid,
    this.refnm,
    @required this.vnm,
    @required this.prc,
    @required this.isChk,
    @required this.sid,
    @required this.sku,
    @required this.qty,
    @required this.qtyInStock,
  });

  final String pid;
  final String image;
  final String name;
  final String desc;
  final String vid;
  final String refid;
  final String refnm;
  final String vnm;
  final double prc;
  final bool isChk;
  final String sid;
  final List<Sku> sku;
  final int qty;
  final int qtyInStock;

  ProdItemCardInCart copyWith({
    String pid,
    String image,
    String name,
    String desc,
    String vid,
    String refid,
    String refnm,
    String vnm,
    double prc,
    bool isChk,
    String sid,
    List<Sku> sku,
    int qty,
    int qtyInStock,
  }) =>
      ProdItemCardInCart(
        pid: pid ?? this.pid,
        image: image ?? this.image,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        vid: vid ?? this.vid,
        refid: refid ?? this.refid,
        refnm: refnm ?? this.refnm,
        vnm: vnm ?? this.vnm,
        prc: prc ?? this.prc,
        isChk: isChk ?? this.isChk,
        sid: sid ?? this.sid,
        sku: sku ?? this.sku,
        qty: qty ?? this.qty,
        qtyInStock: qtyInStock ?? this.qtyInStock,
      );

  factory ProdItemCardInCart.fromMap(Map<String, dynamic> json) =>
      ProdItemCardInCart(
        pid: json["pid"],
        image: json["image"],
        name: json["name"],
        desc: json["desc"],
        vid: json["vid"],
        refid: json["refid"],
        refnm: json["refnm"],
        vnm: json["vnm"],
        prc: json["prc"].toDouble(),
        isChk: json["isChk"],
        sid: json["sid"],
        sku: List<Sku>.from(json["sku"].map((x) => Sku.fromMap(x))),
        qty: json["qty"],
        qtyInStock: json["qtyInStock"],
      );

  Map<String, dynamic> toMap() => {
        "pid": pid,
        "image": image,
        "name": name,
        "desc": desc,
        "vid": vid,
        "refid": refid,
        "refnm": refnm,
        "vnm": vnm,
        "prc": prc,
        "isChk": isChk,
        "sid": sid,
        "sku": List<dynamic>.from(sku.map((x) => x.toMap())),
        "qty": qty,
        "qtyInStock": qtyInStock,
      };
}

class Sku {
  Sku({
    @required this.name,
    @required this.val,
  });

  final String name;
  final String val;

  Sku copyWith({
    String name,
    String val,
  }) =>
      Sku(
        name: name ?? this.name,
        val: val ?? this.val,
      );

  factory Sku.fromMap(Map<String, dynamic> json) => Sku(
        name: json["name"],
        val: json["val"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "val": val,
      };
}

final List<ProdItemCardInCart> prodsInCart = List.generate(
    10,
    (i) => new ProdItemCardInCart(
        pid: 'pid' + i.toString(),
        image:
            "https://img.freepik.com/free-vector/air-travel-logo_1284-753.jpg?size=338&ext=jpg",
        name: 'name' + i.toString(),
        desc: 'desc' + i.toString(),
        vid: 'vid' + i.toString(),
        vnm: 'vnm' + i.toString(),
        prc: 100.99,
        isChk: i % 2 == 0 ? true : false,
        sid: 'sid' + i.toString(),
        sku: [
          new Sku(name: 'Name1', val: 'val1'),
          new Sku(name: 'Name2', val: 'val2'),
          new Sku(name: 'Name3', val: 'val3'),
        ],
        qty: 2,
        qtyInStock: 100));
