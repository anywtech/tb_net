// To parse this JSON data, do
//
//     final viewedCard = viewedCardFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ViewedCard viewedCardFromMap(String str) =>
    ViewedCard.fromMap(json.decode(str));

String viewedCardToMap(ViewedCard data) => json.encode(data.toMap());

class ViewedCard {
  ViewedCard({
    @required this.date,
    @required this.items,
  });

  final String date;
  final List<Item> items;

  ViewedCard copyWith({
    String date,
    List<Item> items,
  }) =>
      ViewedCard(
        date: date ?? this.date,
        items: items ?? this.items,
      );

  factory ViewedCard.fromMap(Map<String, dynamic> json) => ViewedCard(
        date: json["date"],
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "date": date,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class Item {
  Item({
    @required this.name,
    @required this.image,
    @required this.price,
  });

  final String name;
  final String image;
  final double price;

  Item copyWith({
    String name,
    String image,
    double price,
  }) =>
      Item(
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
      );

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        name: json["name"],
        image: json["image"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
        "price": price,
      };
}
