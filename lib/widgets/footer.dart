import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
    this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color == null ? Colors.white : color,
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
