// To parse this JSON data, do
//
//     final productDetail = productDetailFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductDetail productDetailFromMap(String str) =>
    ProductDetail.fromMap(json.decode(str));

String productDetailToMap(ProductDetail data) => json.encode(data.toMap());

class ProductDetail {
  ProductDetail({
    this.id,
    this.name,
    this.desc,
    this.marketPrice,
    this.price,
    this.qty,
    this.skus,
    this.tags,
    this.features,
    this.canBeAgent,
    this.timelimit,
    this.cat,
    this.images,
    this.leadImg,
    this.vendorId,
    this.descImgs,
  });

  final String id;
  final String name;
  final String desc;
  final double marketPrice;
  final double price;
  final int qty;
  final List<Skus> skus;
  final List<String> tags;
  final List<String> features;
  final bool canBeAgent;
  final Timelimit timelimit;
  final Cat cat;
  final List<String> images;
  final List<String> descImgs;
  final String leadImg;
  final String vendorId;

  ProductDetail copyWith({
    String id,
    String name,
    String desc,
    double marketPrice,
    double price,
    int qty,
    List<Skus> skus,
    List<String> tags,
    List<String> features,
    bool canBeAgent,
    Timelimit timelimit,
    Cat cat,
    List<String> images,
    List<String> descImgs,
    String leadImg,
    String vendorId,
  }) =>
      ProductDetail(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        marketPrice: marketPrice ?? this.marketPrice,
        price: price ?? this.price,
        qty: qty ?? this.qty,
        skus: skus ?? this.skus,
        tags: tags ?? this.tags,
        features: features ?? this.features,
        canBeAgent: canBeAgent ?? this.canBeAgent,
        timelimit: timelimit ?? this.timelimit,
        cat: cat ?? this.cat,
        images: images ?? this.images,
        leadImg: leadImg ?? this.leadImg,
        vendorId: vendorId ?? this.vendorId,
        descImgs: descImgs ?? this.descImgs,
      );

  factory ProductDetail.fromMap(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        marketPrice: json["marketPrice"].toDouble(),
        price: json["price"].toDouble(),
        qty: json["qty"],
        skus: List<Skus>.from(json["skus"].map((x) => Skus.fromMap(x))),
        tags: List<String>.from(json["tags"].map((x) => x)),
        features: List<String>.from(json["features"].map((x) => x)),
        canBeAgent: json["canBeAgent"],
        timelimit: Timelimit.fromMap(json["timelimit"]),
        cat: Cat.fromMap(json["cat"]),
        images: List<String>.from(json["images"].map((x) => x)),
        descImgs: List<String>.from(json["descImgs"].map((x) => x)),
        leadImg: json["leadImg"],
        vendorId: json["vendorId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "marketPrice": marketPrice,
        "price": price,
        "qty": qty,
        "skus": List<dynamic>.from(skus.map((x) => x.toMap())),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x)),
        "canBeAgent": canBeAgent,
        "timelimit": timelimit.toMap(),
        "cat": cat.toMap(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "descImgs": List<dynamic>.from(descImgs.map((x) => x)),
        "leadImg": leadImg,
        "vendorId": vendorId,
      };
}

class Cat {
  Cat({
    @required this.id1,
    @required this.name1,
    @required this.id2,
    @required this.name2,
  });

  final String id1;
  final String name1;
  final String id2;
  final String name2;

  Cat copyWith({
    String id1,
    String name1,
    String id2,
    String name2,
  }) =>
      Cat(
        id1: id1 ?? this.id1,
        name1: name1 ?? this.name1,
        id2: id2 ?? this.id2,
        name2: name2 ?? this.name2,
      );

  factory Cat.fromMap(Map<String, dynamic> json) => Cat(
        id1: json["id1"],
        name1: json["name1"],
        id2: json["id2"],
        name2: json["name2"],
      );

  Map<String, dynamic> toMap() => {
        "id1": id1,
        "name1": name1,
        "id2": id2,
        "name2": name2,
      };
}

class Skus {
  Skus({
    @required this.sku,
    @required this.color,
    @required this.model,
    @required this.skusSet,
    @required this.prc,
    @required this.stk,
  });

  final String sku;
  final String color;
  final String model;
  final String skusSet;
  final double prc;
  final int stk;

  Skus copyWith({
    String sku,
    String color,
    String model,
    String skusSet,
    double prc,
    int stk,
  }) =>
      Skus(
        sku: sku ?? this.sku,
        color: color ?? this.color,
        model: model ?? this.model,
        skusSet: skusSet ?? this.skusSet,
        prc: prc ?? this.prc,
        stk: stk ?? this.stk,
      );

  factory Skus.fromMap(Map<String, dynamic> json) => Skus(
        sku: json["_sku"],
        color: json["color"],
        model: json["model"],
        skusSet: json["set"],
        prc: json["_prc"],
        stk: json["_stk"],
      );

  Map<String, dynamic> toMap() => {
        "_sku": sku,
        "color": color,
        "model": model,
        "set": skusSet,
        "_prc": prc,
        "_stk": stk,
      };
}

class Timelimit {
  Timelimit({
    @required this.start,
    @required this.duration,
    @required this.price,
    @required this.qty,
  });

  final String start;
  final int duration;
  final double price;
  final int qty;

  Timelimit copyWith({
    String start,
    int duration,
    double price,
    int qty,
  }) =>
      Timelimit(
        start: start ?? this.start,
        duration: duration ?? this.duration,
        price: price ?? this.price,
        qty: qty ?? this.qty,
      );

  factory Timelimit.fromMap(Map<String, dynamic> json) => Timelimit(
        start: json["start"],
        duration: json["duration"],
        price: json["price"],
        qty: json["qty"],
      );

  Map<String, dynamic> toMap() => {
        "start": start,
        "duration": duration,
        "price": price,
        "qty": qty,
      };
}

//proddetail
final ProductDetail product001 = new ProductDetail(
  id: "10001",
  name: "prod001",
  desc: "prod001  desc prod001 prod001desc prod001 prod001desc prod001 prod001",
  marketPrice: 100.99,
  price: 9.99,
  qty: 100,
  skus: [
    new Skus(
        sku: "sku10001",
        color: "Red",
        model: "model0001",
        skusSet: "skusSet1",
        prc: 10.99,
        stk: 9999),
    new Skus(
        sku: "sku10002",
        color: "Red",
        model: "model0001",
        skusSet: "skusSet1",
        prc: 100.99,
        stk: 9999),
    new Skus(
        sku: "sku10002",
        color: "Red",
        model: "model0001",
        skusSet: "skusSet1",
        prc: 1011.99,
        stk: 9999),
  ],
  tags: [],
  features: [],
  canBeAgent: true,
  timelimit: new Timelimit(
      start: '2020-04-30 00:00:00', duration: 24, price: 10.99, qty: 10),
  cat: new Cat(id1: '10001', name1: 'cat1001', id2: '20001', name2: 'cat20001'),
  images: [
    "https://media.cntraveler.com/photos/581250f2997d59497dccf8bc/16:9/w_2560%2Cc_limit/GettyImages-185298837.jpg",
    "https://cdn.britannica.com/69/155469-131-14083F59/airplane-flight.jpg",
    "https://assets.weforum.org/article/image/WfytOvmrVl8cH4hqhvtHrp9NR6DrCJ10BiZgID56xm8.JPG",
    "https://singularityhub.com/wp-content/uploads/2018/12/airplane-flying-above-clouds_shutterstock_553131187-1068x601.jpg"
  ],
  leadImg:
      "https://www.ishn.com/ext/resources/900x550/airplane-plane-flight-900.jpg?height=635&t=1583412590&width=1200",
  vendorId: 'v10001',
  descImgs: [
    "https://media.cntraveler.com/photos/581250f2997d59497dccf8bc/16:9/w_2560%2Cc_limit/GettyImages-185298837.jpg",
    "https://cdn.britannica.com/69/155469-131-14083F59/airplane-flight.jpg",
    "https://assets.weforum.org/article/image/WfytOvmrVl8cH4hqhvtHrp9NR6DrCJ10BiZgID56xm8.JPG",
    "https://singularityhub.com/wp-content/uploads/2018/12/airplane-flying-above-clouds_shutterstock_553131187-1068x601.jpg"
  ],
);
