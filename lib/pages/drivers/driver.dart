import 'package:flutter/material.dart';

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
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://officesnapshots.com/wp-content/uploads/2021/02/fca-eisner-amper-f.oudeman-med-05.jpg'),
                        fit: BoxFit.fill),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.orange[200],
                          Colors.orange[400],
                          Colors.orange[600]
                        ]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ALIZII DRIVERs',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Turn leisure to cash',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
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
                          Expanded(child: IndicatorCard()),
                          Expanded(child: IndicatorCard()),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(child: IndicatorCard()),
                          Expanded(child: IndicatorCard()),
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
                        height: 80.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 0,
            left: 0,
            child: Container(
              alignment: Alignment.center,
              height: 50.0,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25.0)),
              child: Text(
                'Register Driver RIGHT NOW',
                style: TextStyle(fontWeight: FontWeight.w600),
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

class IndicatorCard extends StatelessWidget {
  const IndicatorCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * .5,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: NetworkImage(''),
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            'Accurate Exposure',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            'Reach to all potiential',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12.0,
            ),
          ),
          Text(
            'clients precisely.',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
