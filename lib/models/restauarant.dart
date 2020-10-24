import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Restaurant {
  final String id;
  final String imageURL;
  final String name;
  final RestaurantLocation location;
  final List<String> transactions;
  final double rating;

  Restaurant({this.id, this.imageURL, this.name, this.location, this.transactions, this.rating});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
        id: json['id'] as String,
        imageURL: json['image_url'] as String,
        name: json['name'] as String,
        transactions: json['transactions'].cast<String>() as List<String>,
        location: RestaurantLocation.fromJson(json['location']),
        rating: json['rating']
    );
  }

  @override
  String toString() {
    return "$id - $imageURL - $name";
  }

  String getRatingImage() {
    switch(rating.toString()) {
      case "0.0": return "stars_extra_large_0.png"; break;
      case "1.0": return "stars_extra_large_1.png"; break;
      case "1.5": return "stars_extra_large_1_half.png"; break;
      case "2.0": return "stars_extra_large_2.png"; break;
      case "2.5": return "stars_extra_large_2_half.png"; break;
      case "3.0": return "stars_extra_large_3.png"; break;
      case "3.5": return "stars_extra_large_3_half.png"; break;
      case "4.0": return "stars_extra_large_4.png"; break;
      case "4.5": return "stars_extra_large_4_half.png"; break;
      case "5.0": return "stars_extra_large_5.png"; break;
      default: return "stars_extra_large_0.png";
    }
  }
}

class RestaurantLocation {
  final String address1;
  final List<String> displayAddress;

  RestaurantLocation({this.address1, this.displayAddress});

  factory RestaurantLocation.fromJson(Map<String, dynamic> json) {
    return RestaurantLocation(
        address1: json['address1'] as String,
        displayAddress: json['display_address'].cast<String>() as List<String>
    );
  }

  String getDisplayAddress() {
    return displayAddress.join(", ");
  }
}
