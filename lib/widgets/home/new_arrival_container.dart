import 'package:flutter/material.dart';

class NewArrivalContainer extends StatelessWidget {
  const NewArrivalContainer({
    Key key,
    this.imgPath,
  }) : super(key: key);

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: Image(
        image: AssetImage(imgPath),
      ),
    );
  }
}
