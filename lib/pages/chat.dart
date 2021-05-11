import 'package:flutter/material.dart';
import 'package:tb_net/pages/tabbarviews/hot_tab_view.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/home/headerbar.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'HOT',
      'FRESH',
      'FOOD',
      'DIGIT',
      'WOMEN',
      'MEN',
      'AUTO',
      'SPORT',
      'GIFT',
      'MEDICAL'
    ];

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: HeaderBar(),
          backgroundColor: Colors.orange,
          bottom: PreferredSize(
            preferredSize: new Size(30, 30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: TabBar(
                  labelColor: Colors.white,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  // indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: EdgeInsets.only(left: 5, right: 5),
                  physics: BouncingScrollPhysics(),
                  tabs: categories
                      .map((e) => Container(
                            height: 20,
                            child: Text(e),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: categories.map((e) {
            return CustomTabBarView(
              category: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CustomTabBarView extends StatelessWidget {
  final String category;

  const CustomTabBarView({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return category == "HOT"
        ? HotTabView()
        : Center(
            child: TextButton(
              child: Text(category),
              onPressed: () {
                Navigator.of(context).pushNamed(RouterPages.Cart);
              },
            ),
          );
  }
}
