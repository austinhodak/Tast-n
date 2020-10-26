import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.yelp.com/v3";
const authHeader =
    "Bearer pz6bDQ13pBlnwkfllPs9Dc76wDixM0Iso7Ra3mzTACSSSGtZrr-qTR4_780dPI9Zhja-ifk7fhkthbtRltsQ_iFTDxUDg-aqXou24O7t2PCMfmxkLOHATmMeg3KLX3Yx";

class YelpAPI {
  static Future getRestaurantList() {
    var url = baseUrl + "/businesses/search?location=16509&categories=restaurants&limit=50";
    return http
        .get(url, headers: {HttpHeaders.authorizationHeader: authHeader});
  }

  static Future getRestaurantDetails(int id) {
    var url = baseUrl + "/businesses/$id";
    return http
        .get(url, headers: {HttpHeaders.authorizationHeader: authHeader});
  }

  static Future getRestaurantReviews(int id) {
    var url = baseUrl + "/businesses/$id/reviews";
    return http
        .get(url, headers: {HttpHeaders.authorizationHeader: authHeader});
  }
}
