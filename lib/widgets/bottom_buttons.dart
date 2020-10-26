import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tastn/models/restauarant.dart';
import 'dart:math' as math;
import 'package:tcard/src/swip_info.dart';
import '../cards.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key key,
    @required TCardController controller, List<Restaurant> list,
  }) : _controller = controller, list = list, super(key: key);

  final TCardController _controller;
  final List<Restaurant> list;

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
          onPressed: () {
            print(list[_controller.index].id);
          },
          tooltip: 'Never Again',
          child: Image(
            image: AssetImage('assets/icons/icons8-trash-144.png'),
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
    );
  }
}