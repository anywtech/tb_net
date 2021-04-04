import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';

class EditingAddress extends StatelessWidget {
  final String type;

  const EditingAddress({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouterPages.EditingAddress),
      ),
      body: Container(),
    );
  }
}
