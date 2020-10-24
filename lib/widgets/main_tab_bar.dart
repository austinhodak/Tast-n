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
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 16.0),
            child: Badge(
              showBadge: false,
              badgeContent: Text(
                "1",
                style: TextStyle(color: Colors.white),
              ),
              child: Image(
                image: AssetImage('assets/icons/icons8-test-account-96.png'),
                height: 36.0,
                width: 36.0,
              ),
            )),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: FlutterToggleTab(
                width: 35,
                borderRadius: 100,
                initialIndex: modeSelectIndex,
                selectedTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                unSelectedTextStyle: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
                labels: ["", "", ""],
                icons: [Icons.person, Icons.people, Icons.group_add_sharp],
                selectedLabelIndex: (index) {
                  print("Selected Index $index");
                },
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(right: 32.0, top: 16.0),
            child: Badge(
              child: Icon(
                Icons.local_dining,
                color: Colors.black,
                size: 28.0,
              ),
            )),
      ],
    );
  }
}
