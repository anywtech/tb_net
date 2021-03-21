import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final String invitedBy;

  const News({Key key, this.invitedBy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Center(
        child: Text('invited by $invitedBy'),
      ),
    );
  }
}
