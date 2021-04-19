// To parse this JSON data, do
//
//     final orderdetail = orderdetailFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Orderdetail orderdetailFromMap(String str) =>
    Orderdetail.fromMap(json.decode(str));

String orderdetailToMap(Orderdetail data) => json.encode(data.toMap());

class Orderdetail {
  Orderdetail({
    @required this.orderId,
    @required this.prds,
    @required this.tlPrc,
    @required this.bank,
    @required this.pDate,
    @required this.sAddr,
    @required this.dDate,
    @required this.cDate,
    @required this.sts,
    @required this.comment,
  });

  final String orderId;
  final List<Prd> prds;
  final double tlPrc;
  final String bank;
  final DateTime pDate;
  final String sAddr;
  final DateTime dDate;
  final DateTime cDate;
  final String sts;
  final String comment;

  Orderdetail copyWith({
    String orderId,
    List<Prd> prds,
    double tlPrc,
    String bank,
    DateTime pDate,
    String sAddr,
    DateTime dDate,
    DateTime cDate,
    String sts,
    String comment,
  }) =>
      Orderdetail(
        orderId: orderId ?? this.orderId,
        prds: prds ?? this.prds,
        tlPrc: tlPrc ?? this.tlPrc,
        bank: bank ?? this.bank,
        pDate: pDate ?? this.pDate,
        sAddr: sAddr ?? this.sAddr,
        dDate: dDate ?? this.dDate,
        cDate: cDate ?? this.cDate,
        sts: sts ?? this.sts,
        comment: comment ?? this.comment,
      );

  factory Orderdetail.fromMap(Map<String, dynamic> json) => Orderdetail(
        orderId: json["orderId"],
        prds: List<Prd>.from(json["prds"].map((x) => Prd.fromMap(x))),
        tlPrc: json["tlPrc"].toDouble(),
        bank: json["bank"],
        pDate: DateTime.parse(json["pDate"]),
        sAddr: json["sAddr"],
        dDate: DateTime.parse(json["dDate"]),
        cDate: DateTime.parse(json["cDate"]),
        sts: json["sts"],
        comment: json["comment"],
      );

  Map<String, dynamic> toMap() => {
        "orderId": orderId,
        "prds": List<dynamic>.from(prds.map((x) => x.toMap())),
        "tlPrc": tlPrc,
        "bank": bank,
        "pDate":
            "${pDate.year.toString().padLeft(4, '0')}-${pDate.month.toString().padLeft(2, '0')}-${pDate.day.toString().padLeft(2, '0')}",
        "sAddr": sAddr,
        "dDate":
            "${dDate.year.toString().padLeft(4, '0')}-${dDate.month.toString().padLeft(2, '0')}-${dDate.day.toString().padLeft(2, '0')}",
        "cDate":
            "${cDate.year.toString().padLeft(4, '0')}-${cDate.month.toString().padLeft(2, '0')}-${cDate.day.toString().padLeft(2, '0')}",
        "sts": sts,
        "comment": comment,
      };
}

class Prd {
  Prd({
    @required this.pid,
    @required this.pnm,
    @required this.pimg,
    @required this.pdesc,
    @required this.vid,
    @required this.vnm,
    @required this.sid,
    @required this.snm,
    @required this.simg,
    @required this.sdesc,
    @required this.color,
    @required this.model,
    @required this.qty,
    @required this.prc,
  });

  final String pid;
  final String pnm;
  final String pimg;
  final String pdesc;
  final String vid;
  final String vnm;
  final String sid;
  final String snm;
  final String simg;
  final String sdesc;
  final String color;
  final String model;
  final int qty;
  final double prc;

  Prd copyWith({
    String pid,
    String pnm,
    String pimg,
    String pdesc,
    String vid,
    String vnm,
    String sid,
    String snm,
    String simg,
    String sdesc,
    String color,
    String model,
    int qty,
    double prc,
  }) =>
      Prd(
        pid: pid ?? this.pid,
        pnm: pnm ?? this.pnm,
        pimg: pimg ?? this.pimg,
        pdesc: pdesc ?? this.pdesc,
        vid: vid ?? this.vid,
        vnm: vnm ?? this.vnm,
        sid: sid ?? this.sid,
        snm: snm ?? this.snm,
        simg: simg ?? this.simg,
        sdesc: sdesc ?? this.sdesc,
        color: color ?? this.color,
        model: model ?? this.model,
        qty: qty ?? this.qty,
        prc: prc ?? this.prc,
      );

  factory Prd.fromMap(Map<String, dynamic> json) => Prd(
        pid: json["pid"],
        pnm: json["pnm"],
        pimg: json["pimg"],
        pdesc: json["pdesc"],
        vid: json["vid"],
        vnm: json["vnm"],
        sid: json["sid"],
        snm: json["snm"],
        simg: json["simg"],
        sdesc: json["sdesc"],
        color: json["color"],
        model: json["model"],
        qty: json["qty"],
        prc: json["prc"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "pid": pid,
        "pnm": pnm,
        "pimg": pimg,
        "pdesc": pdesc,
        "vid": vid,
        "vnm": vnm,
        "sid": sid,
        "snm": snm,
        "simg": simg,
        "sdesc": sdesc,
        "color": color,
        "model": model,
        "qty": qty,
        "prc": prc,
      };
}
