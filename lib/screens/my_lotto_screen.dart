import 'package:flutter/material.dart';
import 'package:lotto_flutter/config/lotto.dart';
import 'package:lotto_flutter/database/DBHelper.dart';
import 'package:lotto_flutter/model/LottoData.dart';
import 'package:lotto_flutter/widgets/lotto_number_set.dart';

class MyLottoScreen extends StatefulWidget {
  @override
  _MyLottoScreenState createState() => _MyLottoScreenState();
}

class _MyLottoScreenState extends State<MyLottoScreen> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Lotto.mainColor,
          title: Text(
            '부자 로또',
            style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
          centerTitle: false,
          floating: true,
        ),
        FutureBuilder(
          future: DBHelper.getLottoDates(),
          builder:
              (BuildContext context, AsyncSnapshot<List<LottoData>> snapshot) {
            if (snapshot.hasData) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                var item = snapshot.data[index];
                return LottoNumberSet(
                  lottoNumbers: [
                    item.lottoNumber1,
                    item.lottoNumber2,
                    item.lottoNumber3,
                    item.lottoNumber4,
                    item.lottoNumber5,
                    item.lottoNumber6
                  ],
                );
              }, childCount: snapshot.data.length));
            } else {
              return SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
