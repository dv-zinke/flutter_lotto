import 'package:flutter/material.dart';
import 'package:lotto_flutter/config/lotto.dart';

class LottoGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
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
      SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
              Text('game 1'),
              Text('game 2'),
              Text('game 3'),
              Text('game 4'),
              Text('game 5'),
              Text('game 6'),
            ],
          ))
    ]));
  }
}
