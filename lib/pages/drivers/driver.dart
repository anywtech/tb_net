import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tb_net/pages/store/my_store.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/common/banner_gradient_and_image.dart';
import 'package:tb_net/widgets/common/custom_button.dart';
import 'package:tb_net/widgets/common/indicator_card.dart';

class Driver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final faq = [
      {"t": "Q", "text": "How to register?"},
      {"t": "A", "text": "How to  w to regis ter w to register?"},
      {"t": "Q", "text": "How to register?"},
      {
        "t": "A",
        "text":
            "How to registe terw to regi sterw to registerw to regisow to register?"
      },
      {"t": "Q", "text": "How to register?"},
      {"t": "A", "text": "How to regist gister ow to register?"},
      {"t": "Q", "text": "How to register?"},
      {
        "t": "A",
        "text":
            "How to register?How to register?How to register?How to register?How to register?How to register?How to register?How to register?How to register?How to register?How to register?How to register?How to register?"
      },
      {"t": "Q", "text": "How to register?"},
      {
        "t": "A",
        "text":
            "How to register w to registr?How to register?How to register?How to register?How to register?How to register?How to register?How to register?How to register?How to register?"
      },
      {"t": "Q", "text": "How to register?"},
      {"t": "A", "text": "How to regist egiste ow to register"},
    ];
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            primary: false,
            child: Column(
              children: [
                BannerGradientAndImage(
                  imgPath: 'assets/img/driver/banner.png',
                  title: 'ALIZII DRIVER',
                  subTitle: 'Turn leisure to cash',
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Why Join us',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'New Vision + Smart Way = Easy Life',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: IndicatorCard(
                              imgPath: 'assets/img/circular.png',
                              title: 'Accurate Exposure',
                              desc:
                                  'Reache to all potential clients rapidly and precisely',
                            ),
                          ),
                          Expanded(
                            child: IndicatorCard(
                              imgPath: 'assets/img/circular.png',
                              title: 'Accurate Exposure',
                              desc:
                                  'Reache to all potential clients rapidly and precisely',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: IndicatorCard(
                              imgPath: 'assets/img/circular.png',
                              title: 'Accurate Exposure',
                              desc:
                                  'Reache to all potential clients rapidly and precisely',
                            ),
                          ),
                          Expanded(
                            child: IndicatorCard(
                              imgPath: 'assets/img/circular.png',
                              title: 'Accurate Exposure',
                              desc:
                                  'Reache to all potential clients rapidly and precisely',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'Frequent Asked Questions',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ...faq
                          .map(
                            (e) => FAQCard(
                              t: e["t"],
                              text: e["text"],
                            ),
                          )
                          .toList(),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const SizedBox(
                        height: 60.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomBackLeadingInSafeArea(),
          Positioned(
            bottom: 15,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomBottomFixedButton(
                text: 'Register Now',
                onTap: () => Navigator.of(context)
                    .popAndPushNamed(RouterPages.RegisterDriver),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQCard extends StatelessWidget {
  const FAQCard({
    this.t,
    this.text,
    Key key,
  }) : super(key: key);
  final String t;
  final String text;

  @override
  Widget build(BuildContext context) {
    return t == "Q"
        ? Container(
            width: MediaQuery.of(context).size.width - 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Q",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(text),
                ),
              ],
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width - 15,
            padding: EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.orange,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ],
            ),
          );
  }
}
