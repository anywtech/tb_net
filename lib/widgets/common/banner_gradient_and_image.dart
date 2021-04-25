import 'package:flutter/material.dart';

class BannerGradientAndImage extends StatelessWidget {
  const BannerGradientAndImage({
    Key key,
    this.imgPath,
    this.title,
    this.subTitle,
  }) : super(key: key);

  final String imgPath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * .3,
      decoration: imgPath == null
          ? BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.orange[200],
                    Colors.orange[400],
                    Colors.orange[600]
                  ]),
            )
          : BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(imgPath), fit: BoxFit.fill),
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
