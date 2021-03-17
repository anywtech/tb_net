/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_net/providers/local_picker.dart';

class LocalPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Consumer<LocalPickerProvider>(
        builder: (__, local, _) => DropdownButton(
          value: local.appLocal,
          icon: Container(width: 12),
          items: I18n.all.map((l) {
            return DropdownMenuItem(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      I18n.getFlg(l.languageCode),
                      style: TextStyle(fontSize: 32),
                    ),
                    Text(
                      l.languageCode,
                    ),
                  ],
                ),
              ),
              value: l,
              onTap: () => local.setLanguage(l, l.languageCode, l.countryCode),
            );
          }).toList(),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
 */
