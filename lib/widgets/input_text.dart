import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final bool isObscure;
  final TextInputType keyboardType;
  final bool isReadOnly;
  final bool autoFocus;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final Widget suffix;
  final String hintText;
  final String labeltext;
  final bool isEnabled;
  final InputBorder border;
  final Color enabledBorderColor;
  final Color disabledBorderColors;
  final Color focusedBorderColors;
  final Color errorBorderColors;
  final double textFieldWidth;
  final void Function(String s) onChanged;
  final String Function(String s) validator;
  final Color cursorColor;
  final void Function() suffixIconEvent;
  final void Function() onTap;

  const InputText({
    Key key,
    this.onChanged,
    this.validator,
    this.controller,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconEvent,
    this.hintText = "",
    this.labeltext = "",
    this.isReadOnly = false,
    this.autoFocus = false,
    this.isEnabled = true,
    this.enabledBorderColor = Colors.grey,
    this.disabledBorderColors = Colors.black,
    this.focusedBorderColors = Colors.orange,
    this.errorBorderColors = Colors.red,
    this.textFieldWidth = 0.0,
    this.cursorColor = Colors.grey,
    this.suffix,
    this.onTap,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      onTap: onTap,
      obscureText: isObscure,
      keyboardType: keyboardType,
      readOnly: isReadOnly,
      autofocus: autoFocus,
      cursorColor: cursorColor,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        // suffixIconConstraints: BoxConstraints(maxHeight: 20),
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
        suffixIcon: suffixIcon == null
            ? null
            : GestureDetector(
                child: Icon(suffixIcon),
                onTap: suffixIconEvent,
              ),
        suffix: suffix,
        hintText: hintText,
        labelText: labeltext,
        enabled: isEnabled,
        border: border,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: disabledBorderColors),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColors),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: errorBorderColors, width: textFieldWidth),
        ),
      ),
    );
  }
}
