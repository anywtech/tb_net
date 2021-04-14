import 'package:flutter/material.dart';

class ButtonAddRem extends StatelessWidget {
  const ButtonAddRem({
    Key key,
    this.reduceEvent,
    this.addEvent,
    this.qty,
  }) : super(key: key);

  final Function reduceEvent;
  final Function addEvent;
  final int qty;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: reduceEvent,
            child: Container(
              alignment: Alignment.center,
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.orange,
                ),
              ),
              child: Text(
                '-',
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 20.0,
            width: 40.0,
            child: Text(qty.toString()),
          ),
          GestureDetector(
            onTap: addEvent,
            child: Container(
              alignment: Alignment.center,
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(
                  width: 1.0,
                  color: Colors.orange,
                ),
              ),
              child: Container(
                child: Text(
                  '+',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
