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
    @required this.brand,
    @required this.saved,
    @required this.marketPrice,
  });

  final String image;
  final double price;
  final String name;
  final String desc;
  final List<String> tags;
  final String brand;
  final double saved;
  final double marketPrice;

  ProdItemPortaitCard copyWith({
    String image,
    double price,
    String name,
    String desc,
    List<String> tags,
    String brand,
    double saved,
    double marketPrice,
  }) =>
      ProdItemPortaitCard(
        image: image ?? this.image,
        price: price ?? this.price,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        tags: tags ?? this.tags,
        brand: brand ?? this.brand,
        marketPrice: marketPrice ?? this.marketPrice,
        saved: saved ?? this.saved,
      );

  factory ProdItemPortaitCard.fromMap(Map<String, dynamic> json) =>
      ProdItemPortaitCard(
        image: json["image"],
        price: json["price"].toDouble(),
        name: json["name"],
        desc: json["desc"],
        brand: json["brand"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        marketPrice: null,
        saved: null,
      );

  Map<String, dynamic> toMap() => {
        "image": image,
        "price": price,
        "name": name,
        "desc": desc,
        "brand": brand,
        "marketPrice": marketPrice,
        "saved": saved,
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
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://pic2.zhimg.com/v2-c03f123671cb7a148613dc8b9f56b498_1440w.jpg?source=172ae18b',
    name: 'name2',
    price: 10.99,
    tags: ["1", "2", "3"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://imagikcorp.com/wp-content/uploads/2016/04/airplanedisplay.jpg',
    name: 'name3',
    price: 10.99,
    tags: ["New Item"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://media.cntraveler.com/photos/5fd26c4ddf72876c320b8001/16:9/w_2560%2Cc_limit/952456172',
    name: 'name3',
    price: 10.99,
    tags: ["1", "2", "3"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'http://cdn.cnn.com/cnnnext/dam/assets/201002160524-airbuszeroe-blended-wing-body-concept.jpg',
    name: 'name3',
    price: 10.99,
    tags: ["1", "2", "3"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://www.rd.com/wp-content/uploads/2020/01/GettyImages-1131335393-e1580493890249-scaled.jpg',
    name: 'name3',
    price: 10.99,
    tags: ["1", "2", "3"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://media.istockphoto.com/photos/passenger-airplane-flying-above-clouds-during-sunset-picture-id155439315?k=6&m=155439315&s=612x612&w=0&h=1bPal14stPAXKODdCMHMUWCVheYPVHXl4iyHDCh2Ndk=',
    name: 'name3',
    price: 10.99,
    tags: ["1", "2", "3"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://media.istockphoto.com/photos/passenger-airplane-flying-above-clouds-during-sunset-picture-id155439315?k=6&m=155439315&s=612x612&w=0&h=1bPal14stPAXKODdCMHMUWCVheYPVHXl4iyHDCh2Ndk=',
    name: 'name3',
    price: 10.99,
    tags: ["1", "2", "3"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
];

final List<ProdItemPortaitCard> recommendedItems4 = [
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRQuIiAihse1x_FMmnc6v0XHFLkmKK0n1lG9sKkI86xHM7N4ONr5kUNm99QtiSA7YU8jc&usqp=CAU',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 10.99,
    tags: ["Special Offer", "Presell", "New Item", "1"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://pic2.zhimg.com/v2-c03f123671cb7a148613dc8b9f56b498_1440w.jpg?source=172ae18b',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 10.99,
    tags: ["1", "2", "3"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://imagikcorp.com/wp-content/uploads/2016/04/airplanedisplay.jpg',
    name: 'name3',
    price: 10.99,
    tags: ["New Item"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://media.cntraveler.com/photos/5fd26c4ddf72876c320b8001/16:9/w_2560%2Cc_limit/952456172',
    name: 'name3',
    price: 10.99,
    tags: ["1", "2", "3"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
];

final List<ProdItemPortaitCard> recommendedItems3 = [
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRQuIiAihse1x_FMmnc6v0XHFLkmKK0n1lG9sKkI86xHM7N4ONr5kUNm99QtiSA7YU8jc&usqp=CAU',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 10.99,
    tags: ["Special Offer", "Presell", "New Item", "1"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://pic2.zhimg.com/v2-c03f123671cb7a148613dc8b9f56b498_1440w.jpg?source=172ae18b',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 10.99,
    tags: ["1", "2", "3"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://imagikcorp.com/wp-content/uploads/2016/04/airplanedisplay.jpg',
    name: 'name3',
    price: 10.99,
    tags: ["New Item"],
    brand: '',
    marketPrice: 0.0,
    saved: 0.0,
  ),
];

final List<ProdItemPortaitCard> recommendedItems6 = [
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://img.ssensemedia.com/images/b_white,g_center,f_auto,q_auto:best/201451M237039_1/gucci-white-bee-new-ace-sneakers.jpg',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 10.99,
    brand: 'GUCCI',
    tags: ["Special Offer", "Presell", "New Item", "1"],
    marketPrice: 19.99,
    saved: 10.99,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://image.goat.com/crop/500/attachments/product_template_additional_pictures/images/040/065/485/original/576959_01.jpg.jpeg?1595973621',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 10.99,
    brand: 'NIKE',
    tags: ["1", "2", "3"],
    marketPrice: 19.99,
    saved: 10.99,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/best-shoes-1610418585.jpg?crop=0.502xw:1.00xh;0.282xw,0&resize=640:*',
    name: 'name3',
    brand: 'ESSENTIAL',
    price: 10.99,
    tags: ["New Item"],
    marketPrice: 19.99,
    saved: 10.99,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://assets.reebok.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/583bed965cf145fe91f7aab101568d43_9366/Classic_Leather_Men\'s_Shoes_White_EG6420_01_standard.jpg',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    brand: 'Rebook',
    price: 10.99,
    tags: ["Special Offer", "Presell", "New Item", "1"],
    marketPrice: 19.99,
    saved: 10.99,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://s7d4.scene7.com/is/image/WolverineWorldWide/HPK-HK162350-012319-F19-000?wid=826&hei=685&resMode=bilin&op_usm=0.5,1.0,8,0&iccEmbed=0&printRes=72',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 10.99,
    brand: 'RUDY MARY JANE',
    tags: ["1", "2", "3"],
    marketPrice: 19.99,
    saved: 10.99,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://cdn.shopify.com/s/files/1/2495/5044/products/oca-low-red-canvas-sneaker.slideshow1_1f09ae39-2cf4-458a-974a-1673f9f61291.jpg?v=1610695036',
    name: 'name3',
    price: 10.99,
    brand: 'CARIUMA',
    tags: ["New Item"],
    marketPrice: 19.99,
    saved: 10.99,
  ),
];

final List<ProdItemPortaitCard> savedItems = [
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://assets.epicurious.com/photos/59275098ec6b83576ab8ee30/1:1/w_1495,h_1495,c_limit/olive-oil-bottles_25052017.jpg',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 110.99,
    brand: 'GUCCI',
    tags: ["Special Offer", "Presell", "New Item", "1"],
    marketPrice: 119.99,
    saved: 10.99,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://previews.123rf.com/images/kiboka/kiboka1708/kiboka170800025/84939582-raw-beaf-meat-and-spices-over-stoun-table.jpg',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 0.99,
    brand: 'NIKE',
    tags: ["1", "2", "3"],
    marketPrice: 11.99,
    saved: 10.99,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://www.recipetineats.com/wp-content/uploads/2020/02/Honey-Garlic-Chicken-Breast_5-SQ.jpg',
    name: 'name3',
    brand: 'ESSENTIAL',
    price: 10.99,
    tags: ["New Item"],
    marketPrice: 19.99,
    saved: 10.99,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-gold-hero?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1604021659000',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    brand: 'Rebook',
    price: 10.99,
    tags: ["Special Offer", "Presell", "New Item", "1"],
    marketPrice: 19.99,
    saved: 10.99,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://images.unsplash.com/photo-1545558014-8692077e9b5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MjR8fHxlbnwwfHx8fA%3D%3D&w=1000&q=80',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 10.99,
    brand: 'RUDY MARY JANE',
    tags: ["1", "2", "3"],
    marketPrice: 19.99,
    saved: 10.99,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://cdn.shopify.com/s/files/1/2495/5044/products/oca-low-red-canvas-sneaker.slideshow1_1f09ae39-2cf4-458a-974a-1673f9f61291.jpg?v=1610695036',
    name: 'name3',
    price: 10.99,
    brand: 'CARIUMA',
    tags: ["New Item"],
    marketPrice: 19.99,
    saved: 10.99,
  ),
];

//timelimitsale

final List<ProdItemPortaitCard> timeLimitedSales = [
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://assets.epicurious.com/photos/59275098ec6b83576ab8ee30/1:1/w_1495,h_1495,c_limit/olive-oil-bottles_25052017.jpg',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 110.99,
    brand: 'GUCCI',
    tags: ["Special Offer", "Presell", "New Item", "1"],
    marketPrice: 119.99,
    saved: 10.99,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://previews.123rf.com/images/kiboka/kiboka1708/kiboka170800025/84939582-raw-beaf-meat-and-spices-over-stoun-table.jpg',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 0.99,
    brand: 'NIKE',
    tags: ["1", "2", "3"],
    marketPrice: 11.99,
    saved: 10.99,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://assets.epicurious.com/photos/59275098ec6b83576ab8ee30/1:1/w_1495,h_1495,c_limit/olive-oil-bottles_25052017.jpg',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 110.99,
    brand: 'GUCCI',
    tags: ["Special Offer", "Presell", "New Item", "1"],
    marketPrice: 119.99,
    saved: 10.99,
  ),
];

//special offers
final List<ProdItemPortaitCard> specialOffers = [
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://assets.epicurious.com/photos/59275098ec6b83576ab8ee30/1:1/w_1495,h_1495,c_limit/olive-oil-bottles_25052017.jpg',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 110.99,
    brand: 'GUCCI',
    tags: ["Special Offer", "Presell", "New Item", "1"],
    marketPrice: 119.99,
    saved: 10.99,
  ),
  new ProdItemPortaitCard(
    desc: "desc",
    image:
        'https://previews.123rf.com/images/kiboka/kiboka1708/kiboka170800025/84939582-raw-beaf-meat-and-spices-over-stoun-table.jpg',
    name: 'iphone X10 Wifi control camera 150000 px new brand strechable lens',
    price: 0.99,
    brand: 'NIKE',
    tags: ["1", "2", "3"],
    marketPrice: 11.99,
    saved: 10.99,
  ),
];
