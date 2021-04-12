import 'package:flutter/material.dart';

class SettingListile extends StatelessWidget {
  final Function tapEvent;
  final Widget leading;
  final String title;
  final TextStyle textStyle;
  final bool trailing;
  final String alignment;

  const SettingListile({
    this.tapEvent,
    this.leading,
    this.title,
    this.textStyle,
    this.trailing,
    this.alignment,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            leading,
            alignment == "Left" ? Container() : const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                title == null ? '' : title,
                style: textStyle,
              ),
            ),
            alignment == "Right" ? Container() : const Spacer(),
            trailing == null || trailing
                ? const Icon(Icons.chevron_right_outlined)
                : const SizedBox(
                    width: 8.0,
                  ),
          ],
        ),
      ),
    );
  }
}
