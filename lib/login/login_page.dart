import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: TinyColor.fromString("#a800ff").darken(35).color,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomPaint(
                                painter: ShapesPainter(),
                                child: Container(height: 250),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 32.0),
                                child: Image(
                                  image:
                                      AssetImage('assets/logos/tastn_logo_3_tp_text.png'),
                                  width: 175,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: Text(
                              "Welcome back!",
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
                          SizedBox(
                            width: double.infinity,
                            height: 60.0,
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                              child: RaisedButton(
                                textColor: Colors.white,
                                color: Colors.purple[500],
                                child: Text(
                                  "Login",
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
                                Text("Forgot Password?",
                                    style: TextStyle(color: Colors.white)),
                                Expanded(child: Container()),
                                Text("Create an account.",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: Text(
                              "Or login with:",
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
                ),
              ],
            ),
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
        BorderSide(color: TinyColor.fromString("#a800ff").darken(25).color));

const double _kCurveHeight = 75;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(
        size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();

    canvas.drawPath(p, Paint()..color = TinyColor.fromString("#a800ff").darken(25).color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}