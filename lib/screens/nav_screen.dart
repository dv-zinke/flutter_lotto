import 'package:flutter/material.dart';
import 'package:lotto_flutter/screens/lotto_game_screen.dart';
import 'package:lotto_flutter/screens/lotto_info_screen.dart';
import 'package:lotto_flutter/screens/my_lotto_screen.dart';
import 'package:lotto_flutter/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    LottoGameScreen(),
    LottoInfoScreen(),
    MyLottoScreen()
  ];

  final List<IconData> _icons = [
    Icons.add,
    Icons.add,
    Icons.add
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        body:IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CustomTabBar(
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index)),
        ),
      ),
    );
  }
}
