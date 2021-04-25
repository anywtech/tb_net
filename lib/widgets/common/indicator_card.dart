import 'package:flutter/material.dart';

class IndicatorCard extends StatelessWidget {
  const IndicatorCard({
    Key key,
    this.imgPath,
    this.title,
    this.desc,
  }) : super(key: key);

  final String imgPath;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
