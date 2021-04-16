import 'package:flutter/material.dart';
import 'package:tb_net/pages/layouts/ordertabview.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List orderTypes = [
      "All",
      "In Process",
      "Completed",
      "Cancelled",
    ];
    return DefaultTabController(
      length: orderTypes.length,
      child: Scaffold(
        body: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                // title: Text('Tabs Demo'),
                backgroundColor: Colors.white,
                actions: [
                  Container(
                    margin: EdgeInsets.only(right: 8.0),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .5,
                    child: TextField(
                      cursorColor: Colors.grey,
                      decoration: const InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),

                        hintText: 'search all orders',
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.all(5),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                    child: Icon(
                      Icons.settings_input_component,
                    ),
                  ),
                ],
                pinned: true,
                floating: true,
                elevation: 0.0,
                bottom: TabBar(
                  physics: BouncingScrollPhysics(),
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.orange,
                  /*     indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange), */
                  indicatorColor: Colors.orange,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  tabs: orderTypes
                      .map(
                        (e) => Tab(
                          child: Text(e),
                        ),
                      )
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: orderTypes.map((e) => OrderTabView()).toList(),
          ),
        ),
      ),
    );
  }
}
