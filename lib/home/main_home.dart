import 'dart:convert';
import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swipe_stack/swipe_stack.dart';
import 'package:tastn/api/yelp.dart';
import 'package:tastn/home/home_swipe_screen.dart';
import 'package:tastn/lib/flutter_toggle_tab.dart';
import 'package:tastn/models/restauarant.dart';
import 'package:tastn/widgets/bottom_buttons.dart';
import 'package:tastn/widgets/main_tab_bar.dart';
import 'package:tastn/widgets/restaurant_card.dart';
import 'package:tinycolor/tinycolor.dart';
import '../cards.dart';

class MainHome extends StatefulWidget {
  MainHome({Key key});

  @override
  State<StatefulWidget> createState() => new _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  TCardController _controller = TCardController();

  Future<void> firebaseAnon() async {
    UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
  }

  var modeSelectIndex = 1;

  @override
  void initState() {
    super.initState();
    firebaseAnon();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: TinyColor.fromString("#FF3C5A").color,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MainTabBar(modeSelectIndex: modeSelectIndex),
              Expanded(
                child: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
                  HomeSwipePage(controller: _controller),
                  HomeSwipePage(controller: _controller),
                  HomeSwipePage(controller: _controller),
                ]),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
