import 'package:country_code_picker/country_code_picker.dart';

import 'package:flutter/material.dart';

class MobileDropdown extends StatefulWidget {
  @override
  _MobileDropdownState createState() => _MobileDropdownState();
}

class _MobileDropdownState extends State<MobileDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /*  CountryCodePicker(
          onChanged: print,
          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
          initialSelection: 'IT',
          favorite: ['+39', 'FR'],
          countryFilter: ['IT', 'FR'],
          // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
          flagDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
          ),
        ), */
        /* SizedBox(
          width: 400,
          height: 60,
          child: CountryCodePicker(
            onChanged: print,
            hideMainText: true,
            showFlagMain: true,
            showFlag: true,
            initialSelection: 'TF',
            hideSearch: true,
            showCountryOnly: true,
            showOnlyCountryWhenClosed: true,
            alignLeft: true,
          ),
        ), */

        CountryCodePicker(
          onChanged: print,
          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
          initialSelection: 'IT',
          favorite: ['+39', 'FR'],
          //countryFilter: ['IT', 'FR'],
          showFlagDialog: true,
          comparator: (a, b) => b.name.compareTo(a.name),
          //Get the country information relevant to the initial selection
          onInit: (code) =>
              print("on init ${code.name} ${code.dialCode} ${code.name}"),
        ),
        CountryCodePicker(
          onChanged: (e) => print(e.toLongString()),
          initialSelection: 'IT',
          favorite: ['+39', 'FR'],
          showFlagDialog: true,
          comparator: (a, b) => b.name.compareTo(a.name),
          onInit: (code) =>
              print("on init ${code.name} ${code.dialCode} ${code.name}"),
        ),
        SizedBox(
          width: 100,
          // height: 60,
          child: CountryCodePicker(
            enabled: true,
            onChanged: (c) => c.name,
            initialSelection: 'TF',
            showCountryOnly: false,
            showOnlyCountryWhenClosed: true,
            favorite: ['+39', 'FR'],
          ),
        ),
      ],
    );
  }
}
