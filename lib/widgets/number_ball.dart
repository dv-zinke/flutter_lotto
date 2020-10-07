import 'package:flutter/material.dart';
import 'package:lotto_flutter/config/lotto.dart';

class NumberBall extends StatelessWidget {
  final int number;

  const NumberBall({
    Key key,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: getNumberBallColor(number),
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
          shape: BoxShape.circle),
      child: Center(
          child: Text(
        number.toString(),
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Colors.black87,
              offset: Offset(1.0, 1.0),
            ),
          ],
        ),
      )),
    );
  }
}

Color getNumberBallColor(int number) {
  Color getNumber;
  if (number < 11) {
    getNumber = Lotto.numColor1;
  } else if (number < 21) {
    getNumber = Lotto.numColor2;
  } else if (number < 31) {
    getNumber = Lotto.numColor3;
  } else if (number < 41) {
    getNumber = Lotto.numColor4;
  } else if (number < 46) {
    getNumber = Lotto.numColor5;
  }
  return getNumber;
}
