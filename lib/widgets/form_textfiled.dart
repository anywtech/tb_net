import 'package:flutter/material.dart';
import 'package:tb_net/widgets/input_text.dart';

class FormTextFiled extends StatelessWidget {
  const FormTextFiled({
    Key key,
    this.leading,
    this.trailing,
    this.hintText,
    this.leadingWidget,
    this.trailingWidget,
    this.onTap,
    this.isReadOnly,
  }) : super(key: key);

  final bool leading;
  final bool trailing;
  final String hintText;
  final Widget leadingWidget;
  final Widget trailingWidget;
  final Function() onTap;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.0),
      decoration: BoxDecoration(
        color: Colors.grey[200].withOpacity(.3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: leading ? leadingWidget : null,
        title: leading
            ? Transform.translate(
                offset: Offset(-15, 0),
                child: InputText(
                  autoFocus: true,
                  hintText: hintText,
                  focusedBorderColors: Colors.transparent,
                  enabledBorderColor: Colors.transparent,
                  onTap: onTap,
                  isReadOnly: isReadOnly == null ? false : isReadOnly,
                ),
              )
            : InputText(
                autoFocus: true,
                hintText: hintText,
                focusedBorderColors: Colors.transparent,
                enabledBorderColor: Colors.transparent,
                onTap: onTap,
                isReadOnly: isReadOnly == null ? false : isReadOnly,
              ),
        trailing: trailing ? trailingWidget : null,
      ),
    );
  }
}
