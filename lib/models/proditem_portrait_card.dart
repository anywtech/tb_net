// To parse this JSON data, do
//
//     final prodItemPortaitCard = prodItemPortaitCardFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProdItemPortaitCard prodItemPortaitCardFromMap(String str) =>
    ProdItemPortaitCard.fromMap(json.decode(str));

String prodItemPortaitCardToMap(ProdItemPortaitCard data) =>
    json.encode(data.toMap());

class ProdItemPortaitCard {
  ProdItemPortaitCard({
    @required this.image,
    @required this.price,
    @required this.name,
    @required this.desc,
    @required this.tags,
  });

  final String image;
  final double price;
  final String name;
  final String desc;
  final List<String> tags;

  ProdItemPortaitCard copyWith({
    String image,
    double price,
    String name,
    String desc,
    List<String> tags,
  }) =>
      ProdItemPortaitCard(
        image: image ?? this.image,
        price: price ?? this.price,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        tags: tags ?? this.tags,
      );

  factory ProdItemPortaitCard.fromMap(Map<String, dynamic> json) =>
      ProdItemPortaitCard(
        image: json["image"],
        price: json["price"].toDouble(),
        name: json["name"],
        desc: json["desc"],
        tags: List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "image": image,
        "price": price,
        "name": name,
        "desc": desc,
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}
