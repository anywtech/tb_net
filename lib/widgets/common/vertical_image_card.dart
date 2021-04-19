import 'package:flutter/material.dart';

class VerticalImageCard extends StatelessWidget {
  const VerticalImageCard({
    Key key,
    this.image,
    this.text,
    this.padding,
  }) : super(key: key);

  final String image;
  final String text;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: padding,
        right: padding,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(image == null
                    ? 'https://mpng.subpng.com/20190714/qvo/kisspng-clip-art-portable-network-graphics-transparency-de-5d2be08738f9b6.8007542515631566152334.jpg'
                    : image),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            width: 40.0,
            alignment: Alignment.center,
            child: Text(
              text == null ? '' : text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10.0,
                // color: Colors.black87.withOpacity(.7),
              ),
            ),
          )
        ],
      ),
    );
  }
}
