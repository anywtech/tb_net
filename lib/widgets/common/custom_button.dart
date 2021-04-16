import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.name,
    this.reversed,
  }) : super(key: key);

  final String name;
  final bool reversed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: reversed ? Colors.white : Colors.orange,
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(
          color: Colors.orange,
          width: 0.0,
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 10.0,
          color: reversed ? Colors.orange : Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
