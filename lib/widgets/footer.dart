import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(color: Colors.orange),
          ),
          Text('  ALIZII - La Vie en Rose'),
        ],
      ),
    );
  }
}
