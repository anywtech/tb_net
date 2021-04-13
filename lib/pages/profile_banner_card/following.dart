import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/footer.dart';

class Following extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final followingItems = [
      {
        "image":
            "https://shelbyreport.nyc3.cdn.digitaloceanspaces.com/wp-content/uploads/2019/01/Costco_Logo-1.jpg",
        "title": "Costco",
        "typeEP": "E",
        "isGurantee": true,
        "rate": 4.9
      },
      {
        "image":
            "https://prod-lippincott.imgix.net/app/uploads/2020/01/02210649/Walmart1_Logo-scaled.jpg?auto=false%2Ccompress&q=90&w=1400",
        "title": "Walmart",
        "typeEP": "E",
        "isGurantee": false,
        "rate": 4.9
      },
      {
        "image":
            "https://upload.wikimedia.org/wikipedia/fr/thumb/d/d7/Logo_Maxi.svg/1200px-Logo_Maxi.svg.png",
        "title": "Menalisa",
        "typeEP": "P",
        "isGurantee": true,
        "rate": 5.0
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(RouterPages.Following),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (__, index) => index == followingItems.length
              ? Footer()
              : FollowListile(
                  followItem: followingItems[index],
                ),
          separatorBuilder: (__, index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            height: 1.0,
            color: Colors.grey[100],
          ),
          itemCount: followingItems.length + 1,
        ),
      ),
    );
  }
}

class FollowListile extends StatelessWidget {
  const FollowListile({
    Key key,
    this.followItem,
  }) : super(key: key);

  final Map followItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
          color: Colors.orange,
          image: DecorationImage(
            image: NetworkImage(followItem["image"]),
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '${followItem["title"]}',
            style: TextStyle(fontSize: 14.0),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Icon(
            followItem["typeEP"] == "E" ? Icons.business : Icons.person,
            size: 12.0,
            color: Colors.orange,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Icon(
            Icons.verified_user_outlined,
            color: followItem["isGurantee"] ? Colors.green : Colors.grey,
            size: 12.0,
          ),
        ],
      ),
      // to run the rating widget or method, parameter followItem["rate"]
      subtitle: Wrap(
        children: [1, 2, 3, 4, 5]
            .map(
              (e) => Icon(
                Icons.star_outline_rounded,
                color: Colors.orange,
                size: 12,
              ),
            )
            .toList(),
      ),
      trailing: Icon(
        Icons.remove_circle_outline,
        size: 14,
        color: Colors.red,
      ),
    );
  }
}
