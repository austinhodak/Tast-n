import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:tastn/lib/flutter_toggle_tab.dart';

class MainTabBar extends StatelessWidget {
  const MainTabBar({
    Key key,
    @required this.modeSelectIndex,
  }) : super(key: key);

  final int modeSelectIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.person),
          ),
          Tab(
            icon: Icon(Icons.restaurant),
          ),
          Tab(
            icon: Icon(Icons.playlist_add_check),
          )
        ],
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}
