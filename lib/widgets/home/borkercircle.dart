import 'package:flutter/material.dart';

class BrokerCircle extends StatelessWidget {
  const BrokerCircle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey[100],
              blurRadius: 2,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'BROKER CIRCLE',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              Text(
                'SEE WHAT THEY SELL',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
              )
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          //to be changed
          Container(
            child: Image(
              image: AssetImage('assets/img/home/1.png'),
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
