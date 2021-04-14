import 'package:flutter/material.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/widgets/prod/prodtag.dart';

class ProdItemListCard extends StatelessWidget {
  const ProdItemListCard({
    this.prodItem,
    Key key,
  }) : super(key: key);

  final ProdItemPortaitCard prodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15.0),
        width: (MediaQuery.of(context).size.width - 15) * .5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width - 45) * .5,
              height: (MediaQuery.of(context).size.width - 45) * .5,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: NetworkImage(prodItem.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              '\$ ${prodItem.price}',
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              prodItem.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              prodItem.desc,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Wrap(children: [
              ...prodItem.tags.map((tag) {
                var color = getColor(tag);
                return ProdTag(
                  tagName: tag,
                  fontColor: color[0],
                  borderColor: color[1],
                );
              }).toList(),
            ]),
          ],
        ));
  }

  List<Color> getColor(String tag) {
    switch (tag) {
      case "Presell":
        return [Colors.teal, Colors.teal[200]];
        break;
      case "Special Offer":
        return [Colors.red, Colors.red[200]];
        break;
      case "New Item":
        return [Colors.orange, Colors.orange[200]];
        break;
      default:
        return [Colors.orange, Colors.orange[200]];
    }
  }
}
