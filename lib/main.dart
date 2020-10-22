import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tastn/home/main_home.dart';
import 'package:tastn/lib/flutter_toggle_tab.dart';
import 'dart:math' as math;
import 'package:gradient_text/gradient_text.dart';
import 'package:tastn/login/login_page.dart';
import 'package:tastn/login/signup_page.dart';
import 'package:tcard/src/swip_info.dart';
import 'cards.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.

  Widget mainApp =  MaterialApp(
    title: 'Tast\'n',
    theme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    /*darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        colorScheme: ColorScheme.dark (
          secondary: Colors.deepPurple,
        ),
        backgroundColor: Colors.grey[800]
    ),*/
    //home: MyHomePage(title: 'Feed Us'),
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  );

  @override
  Widget build(BuildContext context) {
    return mainApp;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MainHome();
  }
}
