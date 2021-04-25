import 'package:flutter/material.dart';
import 'package:tb_net/utils/global_pref.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tb_net/widgets/common/custom_button.dart';

class DriverRegConfirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          Container(
            height: GlobalPref.of(context).ph(35),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.orange[200],
                Colors.orange[300],
                Colors.orange[400],
              ]),
            ),
          ),
          SafeArea(
            child: SizedBox(
              height: 50.0,
              child: AppBar(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: SvgPicture.asset(
                      "assets/icon/svg/md-close.svg",
                    ),
                  ),
                ),
                title: Text(
                  RouterPages.DriverRegConfirm,
                ),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: GlobalPref.of(context).ph(25),
            right: 15.0,
            left: 15.0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  left: 35.0, right: 35.0, top: 35.0, bottom: 5.0),
              height: GlobalPref.of(context).ph(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    color: Colors.grey[100],
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    'Personal Name',
                    style: TextStyle(
                      color: Color(0x9C222F3E),
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Your application is pending for review.\n',
                    style: TextStyle(
                      color: Color(0x9CFF9F43),
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: GlobalPref.of(context).ph(17.5),
            right: GlobalPref.of(context).pw(42),
            left: GlobalPref.of(context).pw(42),
            child: Container(
              height: GlobalPref.of(context).ph(15.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[100],
                        offset: Offset(0, 5),
                        blurRadius: 10.0),
                  ]),
              child: SvgPicture.asset(
                "assets/icon/svg/md-check.svg",
              ),
            ),
          ),
          Positioned(
            top: GlobalPref.of(context).ph(50),
            right: 15.0,
            left: 15.0,
            child: Wrap(alignment: WrapAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Congrats! You are almost there.',
                  style: TextStyle(
                    color: Color(0x9C8395A7),
                    fontSize: 14.0,
                  ),
                ),
              ),
              Text(
                'Estimated Completed on Apr 26, 2021.',
                style: TextStyle(
                  color: Color(0x9C8395A7),
                  fontSize: 14.0,
                ),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomBottomFixedButton(
          text: 'OK',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
