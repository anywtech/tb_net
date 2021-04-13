import 'package:flutter/material.dart';

class RecentViewedListile extends StatelessWidget {
  const RecentViewedListile({
    Key key,
    this.item,
  }) : super(key: key);

  final Map item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print('redirect to page.');
      },
      leading: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(item["image"]),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item["name"],
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(),
          ),
          //single line description
          Text(
            'descriptions descriptions descriptions descriptions ',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          //if any, tags or features
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                margin: EdgeInsets.only(right: 5, top: 5),
                decoration: BoxDecoration(color: Colors.orangeAccent),
                child: Text(
                  '90% rabais',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                margin: EdgeInsets.only(right: 5, top: 5),
                decoration: BoxDecoration(color: Colors.orange),
                child: Text(
                  'First Order Return',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                margin: EdgeInsets.only(right: 5, top: 5),
                decoration: BoxDecoration(color: Colors.red),
                child: Text(
                  'First Order Return',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${item["price"]}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: Colors.red),
              ),
              GestureDetector(
                  child: Icon(
                    Icons.clear,
                    size: 12,
                    color: Colors.grey[400],
                  ),
                  onTap: () {
                    print('removed');
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
