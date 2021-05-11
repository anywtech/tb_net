import 'package:flutter/material.dart';
import 'package:tb_net/widgets/home/new_arrival_container.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'NEW ARRIVAL',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 12.0,
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              NewArrivalContainer(
                  imgPath:
                      'assets/img/home/c837260b4e38856f327cf4453a9fda6c.png'),
              NewArrivalContainer(
                  imgPath:
                      'assets/img/home/b4bce84e729d1dd2e8b057809967f801.png'),
              NewArrivalContainer(
                  imgPath:
                      'assets/img/home/e82532a66c2d66322258accd1fcf3dbd.png'),
              NewArrivalContainer(
                  imgPath:
                      'assets/img/home/b4bce84e729d1dd2e8b057809967f801.png'),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NewArrivalContainer(
                    imgPath:
                        'assets/img/home/c837260b4e38856f327cf4453a9fda6c.png'),
                NewArrivalContainer(
                    imgPath:
                        'assets/img/home/b4bce84e729d1dd2e8b057809967f801.png'),
                NewArrivalContainer(
                    imgPath:
                        'assets/img/home/e82532a66c2d66322258accd1fcf3dbd.png'),
                NewArrivalContainer(
                    imgPath:
                        'assets/img/home/b4bce84e729d1dd2e8b057809967f801.png'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
