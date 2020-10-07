import 'package:flutter/material.dart';
import 'package:lotto_flutter/widgets/lotto_number_set.dart';
import 'package:lotto_flutter/widgets/number_ball.dart';

class MyLottoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: LottoNumberSet(lottoNumbers: [1,11,21,31,33,45], bonusNumber: 1,)),
    );;
  }
}
