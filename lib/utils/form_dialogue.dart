import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class FormDialogue {
  static show(BuildContext context, Widget childWidget) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return WillPopScope(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: childWidget,
              ),
            ),
            onWillPop: () async => false,
          );
        });
  }

  static dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}
