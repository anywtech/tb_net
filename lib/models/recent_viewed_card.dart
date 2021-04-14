// To parse this JSON data, do
//
//     final recentViewedCard = recentViewedCardFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RecentViewedCard recentViewedCardFromMap(String str) =>
    RecentViewedCard.fromMap(json.decode(str));

String recentViewedCardToMap(RecentViewedCard data) =>
    json.encode(data.toMap());

class RecentViewedCard {
  RecentViewedCard({
    @required this.date,
    @required this.rvItems,
  });

  final String date;
  final List<RvItem> rvItems;

  RecentViewedCard copyWith({
    String date,
    List<RvItem> rvItems,
  }) =>
      RecentViewedCard(
        date: date ?? this.date,
        rvItems: rvItems ?? this.rvItems,
      );

  factory RecentViewedCard.fromMap(Map<String, dynamic> json) =>
      RecentViewedCard(
        date: json["date"],
        rvItems:
            List<RvItem>.from(json["rvItems"].map((x) => RvItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "date": date,
        "rvItems": List<dynamic>.from(rvItems.map((x) => x.toMap())),
      };
}

class RvItem {
  RvItem({
    @required this.name,
    @required this.image,
    @required this.price,
  });

  final String name;
  final String image;
  final double price;

  RvItem copyWith({
    String name,
    String image,
    double price,
  }) =>
      RvItem(
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
      );

  factory RvItem.fromMap(Map<String, dynamic> json) => RvItem(
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

final List<RecentViewedCard> recentViewedList = [
  new RecentViewedCard(date: "04-12", rvItems: [
    new RvItem(
        name: "Banane",
        image:
            "https://st3.depositphotos.com/1020804/12760/i/600/depositphotos_127608560-stock-photo-mango-cubes-and-mango-fruit.jpg",
        price: 10.99)
  ]),
  new RecentViewedCard(date: "04-11", rvItems: [
    new RvItem(
        name: "Mango",
        image:
            "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzJ8fGJhbmFuYXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
        price: 0.99),
    new RvItem(
        name: "Mango",
        image: "https://i.ytimg.com/vi/fjsy309KJ1Q/maxresdefault.jpg",
        price: 1000000000.99),
  ]),
];
