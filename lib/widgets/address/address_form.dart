import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_net/providers/address_form.dart';
import 'package:tb_net/utils/form_dialogue.dart';
import 'package:tb_net/widgets/form_textfiled.dart';
import 'package:tb_net/widgets/input_text.dart';
import 'package:tb_net/widgets/mobile_textfiled.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class AddressForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddressFormProvider>(
      create: (_) => AddressFormProvider(),
      child: Consumer<AddressFormProvider>(
        builder: (__, addrFm, _) => SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FormTextFiled(
                      leading: false,
                      trailing: false,
                      hintText: 'enter contact'),
                  FormTextFiled(
                    leading: true,
                    trailing: false,
                    hintText: 'enter current mobile',
                    leadingWidget: CountryCodePicker(
                      padding: EdgeInsets.all(0),
                      onChanged: (e) => print(e.toLongString()),
                      initialSelection: 'CA',
                      favorite: ['US', 'CN'],
                      showFlagDialog: true,
                      comparator: (a, b) => b.name.compareTo(a.name),
                      onInit: (code) => print(
                          "on init ${code.name} ${code.dialCode} ${code.name}"),
                    ),
                  ),
                  FormTextFiled(
                    leading: false,
                    trailing: false,
                    hintText: 'select the area',
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (_) => ManualChooseRegion(),
                    ),
                  ),
                  FormTextFiled(
                    leading: false,
                    trailing: true,
                    hintText: 'enter an address or locate',
                    trailingWidget: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(right: 5, top: 2, bottom: 2),
                        child: Icon(
                          Icons.location_searching,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          addrFm.checkAsDefault
                              ? 'Default Address'
                              : 'Not Default Address',
                        ),
                        Semantics(
                          //label: 'Set as Default',
                          child: Switch.adaptive(
                            activeColor: Colors.orange,
                            value: addrFm.checkAsDefault,
                            onChanged: (bool val) {
                              addrFm.reverseDefault();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.grey.withOpacity(.2),
                              ),
                              right: BorderSide(
                                color: Colors.grey.withOpacity(.2),
                              ),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () => FormDialogue.dismiss(context),
                            child: Icon(Icons.close),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.grey.withOpacity(.2),
                              ),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Icon(Icons.check),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ManualChooseRegion extends StatefulWidget {
  @override
  _ManualChooseRegionState createState() => _ManualChooseRegionState();
}

class _ManualChooseRegionState extends State<ManualChooseRegion> {
  String countryValue;
  String stateValue;
  String cityValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 600,
        child: Column(
          children: [
            SelectState(
              // style: TextStyle(color: Colors.red),
              onCountryChanged: (value) {
                setState(() {
                  countryValue = value;
                });
              },
              onStateChanged: (value) {
                setState(() {
                  stateValue = value;
                });
              },
              onCityChanged: (value) {
                setState(() {
                  cityValue = value;
                });
              },
            ),
            // InkWell(
            //   onTap:(){
            //     print('country selected is $countryValue');
            //     print('country selected is $stateValue');
            //     print('country selected is $cityValue');
            //   },
            //   child: Text(' Check')
            // )
          ],
        ));
  }
}
