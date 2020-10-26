import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tastn/models/restauarant.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({Key key,  this.imageURL, this.name, this.restaurant}) : super(key: key);

  final String imageURL;
  final String name;
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.all(0.0),
        child: Stack(children: <Widget>[
          Positioned.fill(
            child: Stack(alignment: Alignment.bottomCenter, fit: StackFit.expand, children: <Widget>[
              Image.network(imageURL, fit: BoxFit.cover, alignment: Alignment.bottomCenter),
              ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black, Colors.black.withOpacity(0)], stops: [0.6, 0.85]).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: Image.network(imageURL, fit: BoxFit.cover, alignment: Alignment.bottomCenter),
                  )),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "${restaurant.price} • ${restaurant.getCategories()}",
                      style: TextStyle(shadows: [Shadow(color: Colors.black38, offset: Offset(0, 0), blurRadius: 3)], color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      restaurant.getOpenStatus(false),
                      style: TextStyle(shadows: [Shadow(color: Colors.black38, offset: Offset(0, 0), blurRadius: 3)], color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold),
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
                        Expanded(
                          child: AutoSizeText(
                            name != null ? name : "Unknown",
                            style: TextStyle(shadows: [Shadow(color: Colors.black38, offset: Offset(0, 0), blurRadius: 3)], color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            minFontSize: 12.0,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            restaurant.location.getDisplayAddress(),
                            style: TextStyle(shadows: [Shadow(color: Colors.black38, offset: Offset(0, 0), blurRadius: 3)], color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w400),
                          ),
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
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomLeft: Radius.circular(15))),
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
                              image: AssetImage('assets/yelp/ratings/${restaurant.getRatingImage()}'),
                              width: 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Text(
                                  restaurant.reviewCount.toString(),
                                style: TextStyle (
                                  color: Colors.grey,
                                  fontFamily: 'RobotoCondensed'
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              )
            ],
          ),
        ]));
  }
}