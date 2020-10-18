import 'package:flutter/material.dart';
import 'package:lotto_flutter/config/lotto.dart';
import 'package:lotto_flutter/database/DBHelper.dart';
import 'package:lotto_flutter/model/LottoData.dart';
import 'package:lotto_flutter/widgets/lotto_number_set.dart';

class MultiNumberLotto extends StatefulWidget {
  @override
  _MultiNumberLottoState createState() => _MultiNumberLottoState();
}

class _MultiNumberLottoState extends State<MultiNumberLotto> {
  List<int> lottoNumber;

  @override
  void initState() {
    // TODO: implement initState

    this.lottoNumber = getRandomLotto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("연속 번호 뽑기"),
        backgroundColor: Lotto.mainColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            LottoNumberSet(
              lottoNumbers: this.lottoNumber,
            ),
            RaisedButton(
                child: Text("저장"),
                onPressed: () async {
                  DBHelper.insertLotto(LottoData(
                      lottoNumber1: this.lottoNumber[0],
                      lottoNumber2: this.lottoNumber[1],
                      lottoNumber3: this.lottoNumber[2],
                      lottoNumber4: this.lottoNumber[3],
                      lottoNumber5: this.lottoNumber[4],
                      lottoNumber6: this.lottoNumber[5],
                      createdAt: "2022"));
                  var newMemberList = await DBHelper.getLottoDates();
                  print(newMemberList);
                }),
            RaisedButton(
              child: Text("새로뽑기"),
              onPressed: () {
                setState(() {
                  this.lottoNumber = getRandomLotto();
                });
              },
            )
          ],
        ),
      ),
    );
    ;
  }
}

List<int> getRandomLotto() {
  List<int> lotto = [];
  for (var i = 1; i < 46; i++) {
    lotto.add(i);
  }
  lotto.shuffle();
  List<int> getLotto = [
    lotto[0],
    lotto[1],
    lotto[2],
    lotto[3],
    lotto[4],
    lotto[5]
  ];

  getLotto.sort();
  return getLotto;
}
