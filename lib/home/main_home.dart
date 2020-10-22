import 'dart:convert';
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tastn/api/yelp.dart';
import 'package:tastn/lib/flutter_toggle_tab.dart';
import 'dart:math' as math;
import 'package:gradient_text/gradient_text.dart';
import 'package:tastn/login/login_page.dart';
import 'package:tastn/login/signup_page.dart';
import 'package:tcard/src/swip_info.dart';
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

  var restaurants = List<Widget>();

  var _index = 1;

  _getRestaurants() {
    YelpAPI.getRestaurantList().then((response) {
      //print(response.body);
      //Map<String, dynamic> list = jsonDecode(response.body.businesses);
      //print(list);

      var _r = List<Widget>();



      print("TEST");
    });
  }

  @override
  void initState() {
    firebaseAnon();
    _getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {

      restaurants = [card, card];
      _index = 0;
    });
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: SafeArea(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
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
                        initialIndex: _index,
                        selectedTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        unSelectedTextStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
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
                        color: Colors.grey,
                        size: 28.0,
                      ),
                    )),
              ],
            ),
            Expanded(
              child: TCard(
                controller: _controller,
                cards: restaurants,
                size: Size(1000, 1000),
                onForward: (index, info) {
                  print(index);
                },
                onBack: (index) {
                  print(index);
                },
                onEnd: () {
                  print('end');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      _controller.back();
                    },
                    tooltip: 'Rewind',
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Image(
                        image: AssetImage('assets/icons/icons8-reset-96.png'),
                        width: 24,
                      ),
                    ),
                    mini: true,
                    backgroundColor: Colors.white,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      _controller.forward(direction: SwipDirection.Left);
                    },
                    tooltip: 'Nope',
                    child: Image(
                      image: AssetImage('assets/icons/icons8-delete-96.png'),
                      width: 32,
                    ),
                    backgroundColor: Colors.white,
                  ), // This
                  FloatingActionButton(
                    onPressed: () {},
                    tooltip: 'Super Like',
                    child: Image(
                      image: AssetImage('assets/icons/icons8-lightning-bolt-96.png'),
                      width: 24,
                    ),
                    mini: true,
                    backgroundColor: Colors.white,
                  ), // This
                  FloatingActionButton(
                    onPressed: () {
                      _controller.forward();
                    },
                    tooltip: 'Like',
                    child: Image(
                      image: AssetImage('assets/icons/icons8-heart-96.png'),
                      width: 32,
                    ),
                    backgroundColor: Colors.white,
                  ), // This
                  FloatingActionButton(
                    onPressed: () {},
                    tooltip: 'Favorite',
                    child: Image(
                      image: AssetImage('assets/icons/icons8-star-96.png'),
                      width: 24,
                    ),
                    mini: true,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget card = Card (
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    margin: EdgeInsets.all(0.0),
    child: Stack(children: <Widget>[
      Positioned.fill(
        child: Stack(
            alignment: Alignment.bottomCenter,
            fit: StackFit.expand,
            children: <Widget>[
              Image.network(
                  "https://s3-media3.fl.yelpcdn.com/bphoto/F3B1mmiRzds0OEbeddfWfA/o.jpg",
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter),
              ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.black.withOpacity(0)],
                          stops: [0.6, 0.85]).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: Image.network(
                        "https://s3-media3.fl.yelpcdn.com/bphoto/F3B1mmiRzds0OEbeddfWfA/o.jpg",
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter),
                  )),
            ]),
        /*child: Image.network(
            "https://s3-media1.fl.yelpcdn.com/bphoto/gsI5Wzwp2T4D5DsH5b-wbQ/o.jpg",
            fit: BoxFit.fitHeight,
          ),*/
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "\$\$ • Barbeque, Sandwiches, Smokehouse",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.black38,
                            offset: Offset(0, 0),
                            blurRadius: 3)
                      ],
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Open 11:00 AM - 2:00 AM",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.black38,
                            offset: Offset(0, 0),
                            blurRadius: 3)
                      ],
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Federal Hill Smokehouse",
                      style: TextStyle(
                          shadows: [
                            Shadow(
                                color: Colors.black38,
                                offset: Offset(0, 0),
                                blurRadius: 3)
                          ],
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "2609 Peach St",
                      style: TextStyle(
                          shadows: [
                            Shadow(
                                color: Colors.black38,
                                offset: Offset(0, 0),
                                blurRadius: 3)
                          ],
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Image(
                            image: AssetImage('assets/icons/icons8-yelp-144.png'),
                            width: 20,
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/yelp/ratings/stars_extra_large_4_half.png'),
                          width: 100,
                        ),
                      ],
                    ),
                  )),
            ],
          )
        ],
      ),
    ]));