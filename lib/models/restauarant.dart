import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:tastn/extensions.dart';

class Restaurant {
  final String id;
  final String imageURL;
  final String name;
  final RestaurantLocation location;
  final List<String> transactions;
  final double rating;
  final int reviewCount;
  final String price;
  final double distance;
  final List<RestaurantCategory> categories;
  final bool isClosed;

  Restaurant({this.id, this.imageURL, this.name, this.location, this.transactions, this.rating, this.reviewCount, this.price, this.distance, this.categories, this.isClosed});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
        id: json['id'] as String,
        imageURL: json['image_url'] as String,
        name: json['name'] as String,
        transactions: json['transactions'].cast<String>() as List<String>,
        location: RestaurantLocation.fromJson(json['location']),
        rating: json['rating'],
        price: json['price'],
        distance: json['distance'],
        categories: (json['categories'] as List).map((e) => RestaurantCategory.fromJson(e)).toList(),
        isClosed: json['is_closed'],
        reviewCount: json['review_count']);
  }

  @override
  String toString() {
    return "$id - $imageURL - $name";
  }

  String getRatingImage() {
    switch (rating.toString()) {
      case "0.0":
        return "stars_extra_large_0.png";
        break;
      case "1.0":
        return "stars_extra_large_1.png";
        break;
      case "1.5":
        return "stars_extra_large_1_half.png";
        break;
      case "2.0":
        return "stars_extra_large_2.png";
        break;
      case "2.5":
        return "stars_extra_large_2_half.png";
        break;
      case "3.0":
        return "stars_extra_large_3.png";
        break;
      case "3.5":
        return "stars_extra_large_3_half.png";
        break;
      case "4.0":
        return "stars_extra_large_4.png";
        break;
      case "4.5":
        return "stars_extra_large_4_half.png";
        break;
      case "5.0":
        return "stars_extra_large_5.png";
        break;
      default:
        return "stars_extra_large_0.png";
    }
  }

  String getCategories() {
    return categories.join(" • ");
  }

  String getOpenStatus(bool showTransactionTypes) {
    if (!showTransactionTypes) {
      return isClosed ? "Closed" : "Open";
    } else {
      return isClosed ? "Closed" : "Open for ${getTransactionTypes()}";
    }
  }

  String getTransactionTypes() {
    transactions.forEach((element) {
      element.capitalize();
    });
    return transactions.join(", ");
  }
}

class RestaurantLocation {
  final String address1;
  final List<String> displayAddress;

  RestaurantLocation({this.address1, this.displayAddress});

  factory RestaurantLocation.fromJson(Map<String, dynamic> json) {
    return RestaurantLocation(
        address1: json['address1'] as String, displayAddress: json['display_address'].cast<String>() as List<String>);
  }

  String getDisplayAddress() {
    return displayAddress.join(", ");
  }
}

class RestaurantCategory {
  final String alias;
  final String title;

  RestaurantCategory({this.alias, this.title});

  factory RestaurantCategory.fromJson(Map<String, dynamic> json) {
    return RestaurantCategory(
      alias: json['alias'],
      title: json['title']
    );
  }

  @override
  String toString() {
    return title;
  }


}