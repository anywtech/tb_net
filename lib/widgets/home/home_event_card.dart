import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeEventCard extends StatelessWidget {
  const HomeEventCard({
    Key key,
    this.typeIcon,
    this.typeName,
    this.subName,
    this.children,
    this.isSvg,
    this.padding,
  }) : super(key: key);

  final String typeIcon;
  final bool isSvg;
  final String typeName;
  final String subName;
  final List<Widget> children;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding == null
          ? const EdgeInsets.only(
              top: 5.0,
              left: 10.0,
              right: 10.0,
            )
          : padding,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey[100],
              blurRadius: 6,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                width: 30.0,
                child: isSvg
                    ? SvgPicture.asset(
                        typeIcon,
                        fit: BoxFit.contain,
                      )
                    : Image(
                        image: AssetImage(typeIcon),
                      ),
              ),
              const SizedBox(width: 5.0),
              Text(
                typeName,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            subName,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15.0,
          ),
          if (children != null) ...children,
        ],
      ),
    );
  }
}
