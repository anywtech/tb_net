import 'package:flutter/material.dart';

class DeleteConfirmDialog extends StatelessWidget {
  final Function() cancleEvent;
  final Function() okEvent;
  const DeleteConfirmDialog({
    Key key,
    this.cancleEvent,
    this.okEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete'),
      content: Text('Item will be deleted'),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: cancleEvent,
        ),
        TextButton(
          child: Text('Ok'),
          onPressed: okEvent,
        ),
      ],
    );
  }
}
