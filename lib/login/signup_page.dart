import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: TinyColor.fromString("#0D2441").darken(5).color,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    painter: ShapesPainter(),
                    child: Container(height: 300),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Image(
                      image:
                      AssetImage('assets/logos/tastn_logo_3_tp_text.png'),
                      width: 200,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  "Welcome, let's get started!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 24.0, left: 16.0, right: 16.0, bottom: 16.0),
                child: TextField(
                  decoration: new InputDecoration(
                      enabledBorder: fieldBorder,
                      border: fieldBorder,
                      focusedBorder: fieldBorder,
                      filled: true,
                      contentPadding: EdgeInsets.only(left: 32.0),
                      hintStyle: new TextStyle(
                          color: Colors.grey[500], fontSize: 12.0),
                      hintText: "Email",
                      fillColor: Colors.transparent),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
                child: TextField(
                  obscureText: true,
                  decoration: new InputDecoration(
                      enabledBorder: fieldBorder,
                      border: fieldBorder,
                      focusedBorder: fieldBorder,
                      filled: true,
                      contentPadding: EdgeInsets.only(left: 32.0),
                      hintStyle: new TextStyle(
                          color: Colors.grey[500], fontSize: 12.0),
                      hintText: "Password",
                      fillColor: Colors.transparent),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: TextField(
                  obscureText: true,
                  decoration: new InputDecoration(
                      enabledBorder: fieldBorder,
                      border: fieldBorder,
                      focusedBorder: fieldBorder,
                      filled: true,
                      contentPadding: EdgeInsets.only(left: 32.0),
                      hintStyle: new TextStyle(
                          color: Colors.grey[500], fontSize: 12.0),
                      hintText: "Re-enter Password",
                      fillColor: Colors.transparent),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 60.0,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue[900],
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    onPressed: () {},
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(top: 16.0, left: 32.0, right: 32.0),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Text("I already have an account.",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  "Or sign up/login with:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage('assets/logos/icons8-phone-100.png'),
                      width: 56,
                    ),
                    Image(
                      image: AssetImage('assets/logos/icons8-google-200.png'),
                      width: 56,
                    ),
                    Image(
                      image: AssetImage('assets/logos/icons8-facebook-200.png'),
                      width: 56,
                    ),
                    Image(
                      image: AssetImage(
                          'assets/logos/icons8-twitter-circled-200.png'),
                      width: 56,
                    ),
                    Image(
                      image:
                      AssetImage('assets/logos/icons8-apple-logo-200.png'),
                      width: 56,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder fieldBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(40.0),
    ),
    borderSide:
        BorderSide(color: TinyColor.fromString("#0D2441").lighten(5).color));

const double _kCurveHeight = 90;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(
        size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();

    canvas.drawPath(p, Paint()..color = TinyColor.fromString("#0D2441").color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Widget _signInButton() {
  return OutlineButton(
    splashColor: TinyColor.fromString("#e346a4").darken(155).color,
    onPressed: () {},
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    highlightElevation: 0,
    borderSide: BorderSide(color: Colors.white),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage("assets/logos/google_g.png"), height: 35.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
