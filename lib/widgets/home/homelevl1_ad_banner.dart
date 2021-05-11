import 'package:flutter/material.dart';
import 'package:tb_net/utils/global_pref.dart';

class HomeLevl1AdBanner extends StatelessWidget {
  const HomeLevl1AdBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: GlobalPref.of(context).width - 30,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/home/ad1-2.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey[100],
              blurRadius: 6,
            )
          ]),
    );
  }
}
