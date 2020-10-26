import 'dart:convert';
import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swipe_stack/swipe_stack.dart';
import 'package:tastn/api/firebase.dart';
import 'package:tastn/api/yelp.dart';
import 'package:tastn/lib/flutter_toggle_tab.dart';
import 'package:tastn/models/restauarant.dart';
import 'package:tastn/widgets/bottom_buttons.dart';
import 'package:tastn/widgets/main_tab_bar.dart';
import 'package:tastn/widgets/restaurant_card.dart';
import 'package:tinycolor/tinycolor.dart';
import '../cards.dart';
import 'package:tcard/src/swip_info.dart';

class HomeSwipePage extends StatelessWidget {
  const HomeSwipePage({
    Key key,
    @required TCardController controller,
  }) : _controller = controller, super(key: key);

  final TCardController _controller;

  @override
  Widget build(BuildContext context) {
    List<Restaurant> data = List();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: new Container(
            color: Colors.transparent,
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0),
                    )),
                child: Column(
                  children: [
                    Expanded(
                      child: FutureBuilder(
                        future: YelpAPI.getRestaurantList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var restaurants = List<Widget>();
                            final parsed =
                            jsonDecode(snapshot.data.body)['businesses'].cast<Map<String, dynamic>>();
                            data = parsed.map<Restaurant>((json) => Restaurant.fromJson(json)).toList();
                            print(data[0].toString());

                            for (var i = 0; i < data.length; i++) {
                              var restaurant = data[i];
                              restaurants.add(RestaurantCard(
                                imageURL: restaurant.imageURL,
                                name: restaurant.name,
                                restaurant: restaurant,
                              ));
                            }

                            return TCard(
                              controller: _controller,
                              cards: restaurants,
                              size: Size(1000, 1000),
                              onForward: (index, info) {
                                if (info.direction == SwipDirection.Left) {
                                  Firebase().markRestaurantNo(data[index].id);
                                } else {
                                  Firebase().markRestaurantYes(data[index].id);
                                }
                                print(index);

                              },
                              onBack: (index) {
                                print(index);
                              },
                              onEnd: () {
                                print('end');
                              },
                            );
                          } else {
                            return Text("Empty.");
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: BottomButtons(controller: _controller, list: data),
                    )
                  ],
                ))),
      ),
    );
  }
}
