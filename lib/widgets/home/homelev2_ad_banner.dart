import 'package:flutter/material.dart';

class HomeLevl2AdBanner extends StatelessWidget {
  const HomeLevl2AdBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: AssetImage(
                'assets/img/home/97ee0d2cc04fac5318a3997c32ed3c66.jpg'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey[100],
              blurRadius: 2,
            ),
          ]),
    );
  }
}
