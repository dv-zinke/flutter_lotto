import 'package:flutter/material.dart';
import 'package:lotto_flutter/config/lotto.dart';
import 'package:lotto_flutter/widgets/lotto_number_set.dart';
import 'package:lotto_flutter/widgets/widgets.dart';

class MyLottoScreen extends StatelessWidget {
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
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: 20,),
                LottoNumberSet(
                  lottoNumbers: [1, 11, 21, 31, 41, 45],
                ),
                SizedBox(width: 10,),
                Icon(Icons.delete_forever, size: 40,)
              ],
            ),
          ),
        )
      ],
    );
  }
}
