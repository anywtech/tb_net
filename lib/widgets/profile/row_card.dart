import 'package:flutter/material.dart';

class Rowcard extends StatelessWidget {
  final double height;
  final String title;
  final Color color;
  final double margin;
  final List<Widget> children;
  final double hrPadding;

  const Rowcard({
    this.title,
    this.height,
    this.color,
    this.margin,
    this.children,
    this.hrPadding,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      decoration: color == null
          ? BoxDecoration()
          : BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    offset: Offset(0, 5),
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2),
              ],
            ),
      child: Wrap(
        children: [
          title == null
              ? Container()
              : Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 15),
                  color: color,
                  width: double.infinity,
                  child: Text(title),
                ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: hrPadding == null ? 15 : hrPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
