import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/footer.dart';
import 'package:tb_net/widgets/prod/prod_item_listcard.dart';
import 'package:tb_net/widgets/recent_viewed/recent_viewed_prod_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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

    final List<Map> recommendedItems = [
      {
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRQuIiAihse1x_FMmnc6v0XHFLkmKK0n1lG9sKkI86xHM7N4ONr5kUNm99QtiSA7YU8jc&usqp=CAU",
        "price": 10.99,
        "name": "name1",
        "desc": "desc",
        "tags": [
          "Special Offer",
          "Presell",
          "New Item",
          "1"
        ] //uniform with color defined
      },
      {
        "image":
            "https://www.jetsetter.com/wp-content/uploads/sites/7/2018/04/Yq6ObbTP-1-1380x690.jpeg",
        "price": 10.99,
        "name": "name1",
        "desc": "desc",
        "tags": ["1", "2", "3"] //uniform with color defined
      },
      {
        "image":
            "https://imagikcorp.com/wp-content/uploads/2016/04/airplanedisplay.jpg",
        "price": 10.99,
        "name": "name1",
        "desc": "desc",
        "tags": ["New Item"] //uniform with color defined
      },
      {
        "image":
            "https://media.cntraveler.com/photos/5fd26c4ddf72876c320b8001/16:9/w_2560%2Cc_limit/952456172",
        "price": 10.99,
        "name": "name1",
        "desc": "desc",
        "tags": ["1", "2", "3"] //uniform with color defined
      },
      {
        "image":
            "http://cdn.cnn.com/cnnnext/dam/assets/201002160524-airbuszeroe-blended-wing-body-concept.jpg",
        "price": 10.99,
        "name": "name1",
        "desc": "desc",
        "tags": ["1", "2", "3"] //uniform with color defined
      },
      {
        "image":
            "https://www.rd.com/wp-content/uploads/2020/01/GettyImages-1131335393-e1580493890249-scaled.jpg",
        "price": 10.99,
        "name": "name1",
        "desc": "desc",
        "tags": ["1", "2", "3"] //uniform with color defined
      },
      {
        "image":
            "https://media.istockphoto.com/photos/passenger-airplane-flying-above-clouds-during-sunset-picture-id155439315?k=6&m=155439315&s=612x612&w=0&h=1bPal14stPAXKODdCMHMUWCVheYPVHXl4iyHDCh2Ndk=",
        "price": 10.99,
        "name": "name1",
        "desc": "desc",
        "tags": ["1", "2", "3"] //uniform with color defined
      }
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

                  //listcard of production of flow layout wrap
                  ...recommendedItems
                      .map(
                        (e) => ProdItemListCard(prodItem: e),
                      )
                      .toList(),

                  /*   StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) =>
                        new Container(
                            color: Colors.green,
                            child: new Center(
                              child: new CircleAvatar(
                                backgroundColor: Colors.white,
                                child: new Text('$index'),
                              ),
                            )),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, index.isEven ? 2 : 1),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ), */

                  Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
