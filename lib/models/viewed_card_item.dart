// To parse this JSON data, do
//
//     final viewedCardItem = viewedCardItemFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ViewedCardItem viewedCardItemFromMap(String str) =>
    ViewedCardItem.fromMap(json.decode(str));

String viewedCardItemToMap(ViewedCardItem data) => json.encode(data.toMap());

class ViewedCardItem {
  ViewedCardItem({
    @required this.name,
    @required this.image,
    @required this.price,
  });

  final String name;
  final String image;
  final double price;

  ViewedCardItem copyWith({
    String name,
    String image,
    double price,
  }) =>
      ViewedCardItem(
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
      );

  factory ViewedCardItem.fromMap(Map<String, dynamic> json) => ViewedCardItem(
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
