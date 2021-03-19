import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(DateTime.now());
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Container(
          child: Text(
            DateFormat('MM/dd/yyy hh:mm:ss').format(
              DateTime.now(),
            ),
          ),
        );
      },
    );
  }
}
