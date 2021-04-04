import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_net/providers/address_form.dart';
import 'package:tb_net/utils/form_dialogue.dart';
import 'package:tb_net/widgets/input_text.dart';
import 'package:tb_net/widgets/mobile_textfiled.dart';

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
                  ListTile(
                    title: InputText(
                      hintText: 'contact',
                    ),
                  ),
                  MobileTextField(),
                  ListTile(
                    title: InputText(
                      hintText: 'region',
                    ),
                  ),
                  ListTile(
                    title: Container(
                      child: Stack(children: [
                        InputText(
                          hintText: 'detail address',
                        ),
                        Positioned(
                            top: 0,
                            bottom: 0,
                            right: 10,
                            child: Icon(
                              Icons.location_searching,
                              color: Colors.orange,
                            )),
                      ]),
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


/*


Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                color: Colors.red,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      addrFm.checkAsDefault ? 'Default' : 'Not Default',
                    ),
                    const Spacer(),
                    Semantics(
                      label: 'Set as Default',
                      child: Switch.adaptive(
                        value: addrFm.checkAsDefault,
                        onChanged: (bool val) {
                          addrFm.reverseDefault();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<CircleBorder>(
                        CircleBorder(side: BorderSide(color: Colors.red)))),
                onPressed: () => FormDialogue.dismiss(context),
                child: Icon(Icons.close),
              ),
            ],
          ),
        ),*/ 
