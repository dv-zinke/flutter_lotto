import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final List<String> menus;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar({
    Key key,
    @required this.icons,
    @required this.menus,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black, width: 3))),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
              i,
              Tab(
                child: Row(
                  children: [
                    Icon(
                      e,
                      color: i == selectedIndex ? Colors.black : Colors.black45,
                      size: 24,
                    ),
                    Text(
                      menus[i],
                      style: TextStyle(
                        fontSize: 12,
                        color: i == selectedIndex ? Colors.black : Colors.black45,
                      ),
                    ),
                  ],
                ),
              )))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
