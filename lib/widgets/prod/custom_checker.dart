import 'package:flutter/material.dart';

class CustomChecker extends StatelessWidget {
  const CustomChecker({
    Key key,
    this.height,
    this.width,
    this.isChecked,
    this.onTap,
    this.iconSize,
  }) : super(key: key);

  final double height;
  final double width;
  final double iconSize;
  final bool isChecked;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isChecked
          ? Container(
              alignment: Alignment.bottomLeft,
              height: height == null ? 20.0 : height,
              width: width == null ? 20.0 : width,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Icon(
                Icons.check,
                size: iconSize == null ? 14.0 : iconSize,
                color: Colors.white,
              ),
            )
          : Container(
              alignment: Alignment.bottomLeft,
              height: height == null ? 20.0 : height,
              width: width == null ? 20.0 : width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Icon(
                Icons.check,
                size: iconSize == null ? 14.0 : iconSize,
                color: Colors.grey[400],
              ),
            ),
    );
  }
}
