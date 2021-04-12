import 'package:flutter/material.dart';
import 'package:tb_net/models/viewed_card.dart';
import 'package:tb_net/utils/routers.dart';

class RecentViewed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map> viewedList = [
      {
        "date": "04-12",
        "items": [
          {
            "name": "Banane",
            "image":
                "https://st3.depositphotos.com/1020804/12760/i/600/depositphotos_127608560-stock-photo-mango-cubes-and-mango-fruit.jpg",
            "price": 10.99
          },
        ]
      },
      {
        "date": "04-11",
        "items": [
          {
            "name": "Banane",
            "image":
                "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzJ8fGJhbmFuYXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
            "price": 0.99
          },
          {
            "name": "BMW 2020 New Model",
            "image": "https://i.ytimg.com/vi/fjsy309KJ1Q/maxresdefault.jpg",
            "price": 1000000000.99
          },
        ]
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(RouterPages.RecentViewed),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Clear All',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            //viewed list
            ...viewedList
                .map(
                  (e) => RecentViewedProdCard(item: e),
                )
                .toList(),

            // list of recommendation
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                top: 30.0,
                right: 15.0,
                left: 15.0,
              ),
              child: Wrap(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      'You May Like',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      'Service a vous par tout',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),

                  //listcard of production
                  ProdItemListCard(),
                  SizedBox(
                    width: 15.0,
                  ),
                  ProdItemListCard(),
                  ProdItemListCard(),
                  SizedBox(
                    width: 15.0,
                  ),
                  ProdItemListCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProdItemListCard extends StatelessWidget {
  const ProdItemListCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15.0),
        width: (MediaQuery.of(context).size.width - 45) * .5,
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
                  image: NetworkImage(
                      'https://media.istockphoto.com/photos/passenger-airplane-flying-above-clouds-during-sunset-picture-id155439315?k=6&m=155439315&s=612x612&w=0&h=1bPal14stPAXKODdCMHMUWCVheYPVHXl4iyHDCh2Ndk='),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              '\$ 20.99',
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              'Coconut Chunkes Chunkes  Chunkes (3lbs)',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              'desciption of the product, or other informa her information ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Wrap(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  margin: EdgeInsets.only(right: 5, top: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange[200], width: 1.0),
                  ),
                  child: Text(
                    'Special Offer',
                    style: TextStyle(fontSize: 8, color: Colors.orange),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  margin: EdgeInsets.only(right: 5, top: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal[200], width: 1.0),
                  ),
                  child: Text(
                    'Presell',
                    style: TextStyle(fontSize: 8, color: Colors.teal),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  margin: EdgeInsets.only(right: 5, top: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal[200], width: 1.0),
                  ),
                  child: Text(
                    'New Item',
                    style: TextStyle(fontSize: 8, color: Colors.teal),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class RecentViewedProdCard extends StatelessWidget {
  const RecentViewedProdCard({
    Key key,
    this.item,
  }) : super(key: key);

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15.0, top: 10.0),
            child: Text(item["date"]),
          ),
          ...item["items"]
              .map(
                (e) => RecentViewedListile(
                  item: e,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

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
