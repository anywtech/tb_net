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
  final String hintText;
  final String labeltext;
  final bool isEnabled;
  final Color enabledBorderColor;
  final Color disabledBorderColors;
  final Color focusedBorderColors;
  final Color errorBorderColors;
  final double textFieldWidth;
  final void Function(String s) onChanged;
  final String Function(String s) validator;
  final Color cursorColor;
  final void Function() suffixIconEvent;

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      readOnly: isReadOnly,
      autofocus: autoFocus,
      cursorColor: cursorColor,
      decoration: new InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(2.0),
          child: IconButton(
            icon: Icon(suffixIcon),
            onPressed: suffixIconEvent,
          ),
        ),
        hintText: hintText,
        labelText: labeltext,
        enabled: isEnabled,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: enabledBorderColor, width: textFieldWidth),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: disabledBorderColors, width: textFieldWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: focusedBorderColors, width: textFieldWidth),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: errorBorderColors, width: textFieldWidth),
        ),
      ),
    );
  }
}
