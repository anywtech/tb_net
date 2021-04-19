// To parse this JSON data, do
//
//     final orderOverview = orderOverviewFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderOverview orderOverviewFromMap(String str) =>
    OrderOverview.fromMap(json.decode(str));

String orderOverviewToMap(OrderOverview data) => json.encode(data.toMap());

class OrderOverview {
  OrderOverview({
    @required this.oId,
    @required this.prdsOv,
    @required this.tlPrc,
    @required this.pDate,
    @required this.sts,
  });

  final String oId;
  final List<PrdsOv> prdsOv;
  final double tlPrc;
  final String pDate;
  final String sts;

  OrderOverview copyWith({
    String oId,
    List<PrdsOv> prdsOv,
    double tlPrc,
    String pDate,
    String sts,
  }) =>
      OrderOverview(
        oId: oId ?? this.oId,
        prdsOv: prdsOv ?? this.prdsOv,
        tlPrc: tlPrc ?? this.tlPrc,
        pDate: pDate ?? this.pDate,
        sts: sts ?? this.sts,
      );

  factory OrderOverview.fromMap(Map<String, dynamic> json) => OrderOverview(
        oId: json["oId"],
        prdsOv: List<PrdsOv>.from(json["prdsOv"].map((x) => PrdsOv.fromMap(x))),
        tlPrc: json["tlPrc"].toDouble(),
        pDate: json["pDate"],
        sts: json["sts"],
      );

  Map<String, dynamic> toMap() => {
        "oId": oId,
        "prdsOv": List<dynamic>.from(prdsOv.map((x) => x.toMap())),
        "tlPrc": tlPrc,
        "pDate": pDate,
        "sts": sts,
      };
}

class PrdsOv {
  PrdsOv({
    @required this.pid,
    @required this.pnm,
    @required this.pimg,
    @required this.pdesc,
    @required this.vid,
    @required this.sid,
  });

  final String pid;
  final String pnm;
  final String pimg;
  final String pdesc;
  final String vid;
  final String sid;

  PrdsOv copyWith({
    String pid,
    String pnm,
    String pimg,
    String pdesc,
    String vid,
    String sid,
  }) =>
      PrdsOv(
        pid: pid ?? this.pid,
        pnm: pnm ?? this.pnm,
        pimg: pimg ?? this.pimg,
        pdesc: pdesc ?? this.pdesc,
        vid: vid ?? this.vid,
        sid: sid ?? this.sid,
      );

  factory PrdsOv.fromMap(Map<String, dynamic> json) => PrdsOv(
        pid: json["pid"],
        pnm: json["pnm"],
        pimg: json["pimg"],
        pdesc: json["pdesc"],
        vid: json["vid"],
        sid: json["sid"],
      );

  Map<String, dynamic> toMap() => {
        "pid": pid,
        "pnm": pnm,
        "pimg": pimg,
        "pdesc": pdesc,
        "vid": vid,
        "sid": sid,
      };
}

final List<OrderOverview> orderList = [
  new OrderOverview(
      oId: "O2023400X00002321",
      prdsOv: [
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
      ],
      tlPrc: 100.99,
      pDate: "Apr16,2021",
      sts: ""),
  new OrderOverview(
      oId: "O2023400X00002321",
      prdsOv: [
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
      ],
      tlPrc: 100.99,
      pDate: "Apr16,2021",
      sts: ""),
  new OrderOverview(
      oId: "O2023400X00002321",
      prdsOv: [
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
      ],
      tlPrc: 100.99,
      pDate: "Apr16,2021",
      sts: ""),
  new OrderOverview(
      oId: "O2023400X00002321",
      prdsOv: [
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
      ],
      tlPrc: 100.99,
      pDate: "Apr16,2021",
      sts: ""),
  new OrderOverview(
      oId: "O2023400X00002321",
      prdsOv: [
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
      ],
      tlPrc: 100.99,
      pDate: "Apr16,2021",
      sts: ""),
  new OrderOverview(
      oId: "O2023400X00002321",
      prdsOv: [
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
        new PrdsOv(
            pid: "100001",
            pnm: "Mango",
            pimg:
                "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
            pdesc: "pdesc pdesc pd esc pdesc pdes pde scp desc",
            vid: "2000000001",
            sid: "s1"),
      ],
      tlPrc: 100.99,
      pDate: "Apr16,2021",
      sts: ""),
];
/* 
final List<OrderOverview> orderList = [
  OrderOverview.fromMap({
    "oId": "O2023400X00002321",
    "prdsOv": [
      PrdsOv.fromMap({
        "pid": "100001",
        "pnm": "Mango",
        "pimg": "",
        "pdesc": "pdesc pdesc pd esc pdesc pdes pde scp desc",
        "vid": "2000000001",
        "sid": "s1"
      }),
    ],
    "tlPrc": 100.99,
    "pDate": "2021-04-16",
    "sts": "",
  }),
  OrderOverview.fromMap({
    "oId": "O2023400X00002321",
    "prdsOv": [
      PrdsOv.fromMap({
        "pid": "100001",
        "pnm": "Apple",
        "pimg":
            "https://cdn4.vectorstock.com/i/1000x1000/27/68/mango-fruit-isolated-on-white-background-vector-20512768.jpg",
        "pdesc": "pdesc pdesc pd esc pdesc pdes pde scp desc",
        "vid": "2000000001",
        "sid": "s1"
      }),
    ],
    "tlPrc": 100.99,
    "pDate": "2021-04-16",
    "sts": "",
  }),
  OrderOverview.fromMap({
    "oId": "O2023400X00002321",
    "prdsOv": [
      PrdsOv.fromMap({
        "pid": "100001",
        "pnm": "Mango",
        "pimg":
            "https://cdn4.vectorstock.com/i/1000x1000/27/68/mango-fruit-isolated-on-white-background-vector-20512768.jpg",
        "pdesc": "pdesc pdesc pd esc pdesc pdes pde scp desc",
        "vid": "2000000001",
        "sid": "s1"
      }),
      PrdsOv.fromMap({
        "pid": "100001",
        "pnm": "Apple",
        "pimg":
            "https://s1.1zoom.me/big0/390/Apples_Closeup_Two_White_490120.jpg",
        "pdesc": "pdesc pdesc pd esc pdesc pdes pde scp desc",
        "vid": "2000000001",
        "sid": "s1"
      }),
      PrdsOv.fromMap({
        "pid": "100001",
        "pnm": "Banana",
        "pimg":
            "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
        "pdesc": "pdesc pdesc pd esc pdesc pdes pde scp desc",
        "vid": "2000000001",
        "sid": "s1"
      }),
    ],
    "tlPrc": 100.99,
    "pDate": "2021-04-16",
    "sts": "",
  }),
  OrderOverview.fromMap({
    "oId": "O2023400X00002321",
    "prdsOv": [
      PrdsOv.fromMap({
        "pid": "100001",
        "pnm": "Mango",
        "pimg":
            "https://upload.wikimedia.org/wikipedia/commons/6/69/Banana_%28white_background%29.jpg",
        "pdesc": "pdesc pdesc pd esc pdesc pdes pde scp desc",
        "vid": "2000000001",
        "sid": "s1"
      }),
    ],
    "tlPrc": 100.99,
    "pDate": "2021-04-16",
    "sts": "",
  }),
];
 */
