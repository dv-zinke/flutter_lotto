import 'package:flutter/material.dart';
import 'package:lotto_flutter/widgets/number_ball.dart';

class MyLottoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: NumberBall(number: 5,)),
    );;
  }
}
