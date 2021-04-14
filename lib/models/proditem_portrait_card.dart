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

final List<ProdItemPortaitCard> recommendedItems = [
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRQuIiAihse1x_FMmnc6v0XHFLkmKK0n1lG9sKkI86xHM7N4ONr5kUNm99QtiSA7YU8jc&usqp=CAU',
    name: 'name1',
    price: 10.99,
    tags: ["Special Offer", "Presell", "New Item", "1"],
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://www.jetsetter.com/wp-content/uploads/sites/7/2018/04/Yq6ObbTP-1-1380x690.jpeg',
    name: 'name2',
    price: 10.99,
    tags: ["1", "2", "3"],
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://imagikcorp.com/wp-content/uploads/2016/04/airplanedisplay.jpg',
    name: 'name3',
    price: 10.99,
    tags: ["New Item"],
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://media.cntraveler.com/photos/5fd26c4ddf72876c320b8001/16:9/w_2560%2Cc_limit/952456172',
    name: 'name3',
    price: 10.99,
    tags: ["1", "2", "3"],
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'http://cdn.cnn.com/cnnnext/dam/assets/201002160524-airbuszeroe-blended-wing-body-concept.jpg',
    name: 'name3',
    price: 10.99,
    tags: ["1", "2", "3"],
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://www.rd.com/wp-content/uploads/2020/01/GettyImages-1131335393-e1580493890249-scaled.jpg',
    name: 'name3',
    price: 10.99,
    tags: ["1", "2", "3"],
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://media.istockphoto.com/photos/passenger-airplane-flying-above-clouds-during-sunset-picture-id155439315?k=6&m=155439315&s=612x612&w=0&h=1bPal14stPAXKODdCMHMUWCVheYPVHXl4iyHDCh2Ndk=',
    name: 'name3',
    price: 10.99,
    tags: ["1", "2", "3"],
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://media.istockphoto.com/photos/passenger-airplane-flying-above-clouds-during-sunset-picture-id155439315?k=6&m=155439315&s=612x612&w=0&h=1bPal14stPAXKODdCMHMUWCVheYPVHXl4iyHDCh2Ndk=',
    name: 'name3',
    price: 10.99,
    tags: ["1", "2", "3"],
  ),
];
