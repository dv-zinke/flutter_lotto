import 'package:flutter/material.dart';
import 'package:lotto_flutter/config/lotto.dart';
import 'package:lotto_flutter/database/DBHelper.dart';
import 'package:lotto_flutter/model/LottoData.dart';
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
        child:  Column(
          children: [
            LottoNumberSet(
              lottoNumbers: [1, 11, 21, 31, 41, 45],
            ),
            RaisedButton(child:Text("저장"),onPressed: () async {
              DBHelper.insertLotto(
                LottoData(
                  lottoNumber1: 1,
                  lottoNumber2: 2,
                  lottoNumber3: 3,
                  lottoNumber4: 31,
                  lottoNumber5: 41,
                  lottoNumber6: 6,
                  createdAt: "2022"
                )
              );
              var newMemberList = await DBHelper.getLottoDates();
              print(newMemberList);

            })
          ],
        ),
      ),
    );
  }
}
