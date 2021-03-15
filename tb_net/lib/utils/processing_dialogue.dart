import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class ProcessingDialogue {
  static show(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return WillPopScope(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            onWillPop: () async => false,
          );
        });
  }

  static dismiss(BuildContext context) {
    Navigator.pop(context);
  }

  static toastcontent(BuildContext context, String msg) {
    Fluttertoast.showToast(msg: msg);
  }
}
