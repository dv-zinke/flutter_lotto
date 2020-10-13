import 'package:flutter/material.dart';
import 'package:lotto_flutter/config/lotto.dart';
import 'package:lotto_flutter/widgets/lotto_number_set.dart';

class MultiNumberLotto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("연속 번호 뽑기"),
        backgroundColor: Lotto.mainColor,
        leading:
            IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Center(child:  LottoNumberSet(
          lottoNumbers: [1, 11, 21, 31, 41, 45],
        ),),
      ),
    );
  }
}
