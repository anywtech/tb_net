import 'package:flutter/material.dart';
import 'package:tb_net/utils/global_pref.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      /*   padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ), */
      child: Row(
        children: [
          Text(
            'ALIZII',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Container(
            width: GlobalPref.of(context).width * .6,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14.0),
              onChanged: (value) => print(value),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 15.0,
                ),
                suffixIconConstraints: BoxConstraints(minHeight: 30),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: 'La vie en rose',
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.qr_code_scanner_rounded),
                ),
              ),
              cursorColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
