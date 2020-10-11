import 'package:flutter/material.dart';
import 'package:lotto_flutter/widgets/number_ball.dart';




class LottoNumberSet extends StatelessWidget {
  final List<int> lottoNumbers;
  final int bonusNumber;
  const LottoNumberSet({
    Key key,
    @required this.lottoNumbers,
    this.bonusNumber
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(children: [
      NumberBall(number: lottoNumbers[0],),
      NumberBall(number: lottoNumbers[1],),
      NumberBall(number: lottoNumbers[2],),
      NumberBall(number: lottoNumbers[3],),
      NumberBall(number: lottoNumbers[4],),
      NumberBall(number: lottoNumbers[5],),
      bonusNumber == null ?  Container() : Icon(Icons.add),
      bonusNumber == null ?  Container() : NumberBall(number: lottoNumbers[5],),

    ],);
  }
}

List<Widget> getNumberWidget(List<int> lottoNumbers) {
  List<Widget> lottoNumberWidgets = [];
  for(int i=0; i<lottoNumbers.length; i++ ) {
      lottoNumberWidgets.add(NumberBall(number: lottoNumbers[i],));
  }

  return lottoNumberWidgets;
}
