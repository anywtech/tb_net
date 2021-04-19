import 'package:flutter/material.dart';

class MyStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        'ALIZII STORE',
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
                        'Start businesses simply and rapidly',
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
                        'ALIZII makes life better!',
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
                        'Your Next Flagshops',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'New Vision + Smart Way = High Profit',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(width: 15.0),
                            FlagShopCard(),
                            const SizedBox(width: 15.0),
                            FlagShopCard(),
                            const SizedBox(width: 15.0),
                          ],
                        ),
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
                'OPEN MY STORE RIGHT NOW',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlagShopCard extends StatelessWidget {
  const FlagShopCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 45,
      padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 15),
          color: Colors.grey[200],
          blurRadius: 7,
          spreadRadius: 5,
        )
      ]),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * .5,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: NetworkImage(
                    'https://web.uponor.hk/wp-content/uploads/2018/05/How-To-Build-A-Sustainable-Office-Space.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            tileColor: Colors.white,
            leading: Container(
              width: 50.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://logos-world.net/wp-content/uploads/2020/11/Costco-Wholesale-Logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            title: Text(
              'COSTCO',
              style: TextStyle(fontSize: 14.0),
            ),
            subtitle: Text(
              'Retail Wareshouse',
              style: TextStyle(fontSize: 12.0),
            ),
            trailing: Icon(
              Icons.open_in_new_outlined,
              size: 18.0,
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
