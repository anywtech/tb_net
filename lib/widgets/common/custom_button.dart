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

class CustomBottomFixedButton extends StatelessWidget {
  const CustomBottomFixedButton({
    Key key,
    this.onTap,
    this.text,
  }) : super(key: key);

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(25.0)),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
