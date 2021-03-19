import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tb_net/providers/home.dart';

class LocalePicker extends StatelessWidget {
  final IconData iconData;
  final HomeProvider T;

  const LocalePicker({
    Key key,
    @required this.iconData,
    @required this.T,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        icon: Icon(iconData),
        items: T.listLocale.map((l) {
          return DropdownMenuItem(
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /* Text(
                    I18n.getFlg(l.languageCode),
                    style: TextStyle(fontSize: 32),
                  ), */
                  Text(
                    l.languageCode,
                  ),
                ],
              ),
            ),
            value: l,
            onTap: () => T.setLocale(l),
          );
        }).toList(),
        onChanged: (value) {},
        value: T.locale,
      ),
    );
  }
}
