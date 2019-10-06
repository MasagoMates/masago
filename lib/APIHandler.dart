import 'dart:collection';
import'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:masago/DistanceJSON.dart';

import 'Card.dart';
import 'Restaurant.dart';
import 'Delivery.dart';
import 'User.dart';
import 'Post.dart';

import 'package:http/http.dart' as http;

class APIHandler{

  final String APIKey = "AIzaSyCwyk5kNnByl0VAo37RILWmo_cTAvCXj5U";
  Queue<Card> cards;

  APIHandler(){
    User user = new User();
    cards = new Queue<Card>();
    List<String> foods = createFoodsList();
    Set<String> set = Set.from(foods);
    set.forEach((element) => callGoogleMapsAPIForNearbyRestaurants(element));
  }

  List<String> createFoodsList(){
    List<String> foods = new List<String>();
    foods.add("burgers");
    foods.add("pizza");
    foods.add("sushi");
    foods.add("ramen");
    foods.add("italian_food");
    foods.add("pasta");
    foods.add("salad");
    foods.add("sandwich");
    foods.add("American_BBQ");
    foods.add("pho");
    foods.add("tacos");
    foods.add("ice_cream");
    foods.add("dumplings");
    foods.add("chinese_food");
    foods.add("bread");
    foods.add("steak");
    foods.add("fried_chicken");
    foods.add("lobster");
    foods.add("milkshake");
    foods.add("smoothie");
    foods.add("burrito");
    foods.add("coffee");
  }

  /*
  Calls the Google API to get data about places nearby
   */
  void callGoogleMapsAPIForNearbyRestaurants(String query){
    String requestURL = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + query + "&key=" + APIKey;
    Future<Post> results = fetchPost(requestURL);
    }


  void callGoogleMapsAPIForRestaurantDistance(String origin, String destination){
    origin = "480+Wakara+Way+Salt+Lake+City+ON";
    destination = "1309+Foothill+Dr+Salt+Lake+City+ON";
    String requestURL = "https://maps.googleapis.com/maps/api/distancematrix/json?origins="+ origin + "&destinations=" + destination + "&units=imperial&key=" + APIKey;
    Future<DistanceJSON> results = fetchDistanceJSON(requestURL);
  }


}


Future<Post> fetchPost(String URL) async {
  final response = await http.get(URL);

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  }else{
    throw Exception('FAILED TO SEND/RECIEVE POST REQUEST');
  }
}

Future<DistanceJSON> fetchDistanceJSON(String URL) async {
  final response = await http.get(URL);

  if (response.statusCode == 200) {
    return DistanceJSON.fromJson(json.decode(response.body));
  }else{
    throw Exception('FAILED TO SEND/RECIEVE POST REQUEST');
  }
}