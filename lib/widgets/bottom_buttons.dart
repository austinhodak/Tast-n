import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:tcard/src/swip_info.dart';
import '../cards.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key key,
    TCardController controller,
  }) : _controller = controller, super(key: key);

  final TCardController _controller;

  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            //_controller.back();
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
           // _controller.forward(direction: SwipDirection.Left);
          },
          tooltip: 'Nope',
          child: Image(
            image: AssetImage('assets/icons/icons8-delete-96.png'),
            width: 32,
          ),
          backgroundColor: Colors.white,
        ), // This
        /*FloatingActionButton(
          onPressed: () {},
          tooltip: 'Super Like',
          child: Image(
            image: AssetImage('assets/icons/icons8-lightning-bolt-96.png'),
            width: 24,
          ),
          mini: true,
          backgroundColor: Colors.white,
        ), // This*/
        FloatingActionButton(
          onPressed: () {
            //_controller.forward();
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
    );
  }
}