import 'package:flutter/material.dart';

class TwolineCard extends StatelessWidget {
  final String leadingText;
  final IconData leadingIcon;
  final String trailingText;
  final Color trailingColor;
  final Function() onTap;
  final bool isBottom;

  const TwolineCard({
    Key key,
    this.leadingText,
    this.leadingIcon,
    this.trailingText,
    this.trailingColor,
    this.isBottom,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            leadingIcon == null
                ? Text(
                    leadingText,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  )
                : Icon(
                    leadingIcon,
                    size: 22,
                  ),
            const SizedBox(
              height: 5,
            ),
            Text(
              trailingText,
              style: TextStyle(
                  fontSize: 12,
                  color: trailingColor == null ? Colors.black : Colors.grey),
            ),
            isBottom == null
                ? const SizedBox(
                    height: 5,
                  )
                : const SizedBox(
                    height: 15,
                  ),
          ],
        ),
      ),
    );
  }
}
