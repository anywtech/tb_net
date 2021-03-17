import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_net/providers/home.dart';

class TimeShower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Consumer<HomeProvider>(builder: (__, h, _) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                h.timerRunner();
              },
              child: Text('start'),
            ),
            ElevatedButton(
              onPressed: () {
                h.cancelRunner();
              },
              child: Text('stop'),
            ),
            h.timePoint == "" ? Text('loading...') : Text(h.timePoint),
          ],
        );
      }),
    );
  }
}
