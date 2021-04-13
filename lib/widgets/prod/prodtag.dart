import 'package:flutter/material.dart';

class ProdTag extends StatelessWidget {
  const ProdTag({
    this.borderColor,
    this.fontColor,
    @required this.tagName,
    Key key,
  }) : super(key: key);

  final Color borderColor;
  final Color fontColor;
  final String tagName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      margin: EdgeInsets.only(right: 5, top: 5),
      decoration: BoxDecoration(
        border: Border.all(
            color: borderColor == null ? Colors.orange[200] : borderColor,
            width: 1.0),
      ),
      child: Text(
        tagName,
        style: TextStyle(
            fontSize: 8, color: fontColor == null ? Colors.orange : fontColor),
      ),
    );
  }
}
