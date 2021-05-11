import 'package:flutter/material.dart';

class HeaderCategoryBar extends StatefulWidget {
  @override
  _HeaderCategoryBarState createState() => _HeaderCategoryBarState();
}

class _HeaderCategoryBarState extends State<HeaderCategoryBar> {
  List<String> categories = [
    'HOT',
    'FRESH',
    'FOOD',
    'ELECTRONIC',
    'WOMEN',
    'MEN',
    'AUTOMOTIVE',
    'SPORT',
    'GIFT',
    'MEDICAL'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      height: 30.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (__, int index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
              top: 8.0,
            ),
            child: Column(
              children: [
                Text(
                  categories[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: selectedIndex == index
                        ? Colors.white
                        : Color(0x9CFFFFFF).withOpacity(.8),
                  ),
                ),
                Container(
                  height: 2.0,
                  width: 15.0,
                  color: selectedIndex == index
                      ? Colors.white
                      : Colors.transparent,
                  padding: EdgeInsets.symmetric(
                    vertical: 3.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
