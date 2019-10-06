import 'dart:collection';
import'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/services.dart';
import 'package:masago/DistanceJSON.dart';
import 'package:masago/RestaurantJSON.dart';

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
    set.forEach((element) => createCard(element));
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

  void SwipedRight(String foodItem){
    callGoogleMapsAPIForNearbyRestaurants(foodItem);
    callGoogleMapsAPIForRestaurantDistance(origin, destination)
  }

  /*
  Calls the Google API to get data about places nearby
   */
  void callGoogleMapsAPIForNearbyRestaurants(String query){
    String requestURL = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + query + "&key=" + APIKey;
    Future<Post> results = fetchPost(requestURL);
    sortRestaurants(query, results);
    }


  void callGoogleMapsAPIForRestaurantDistance(String origin, String destination){
    origin = "480+Wakara+Way+Salt+Lake+City+ON";
    destination = "1309+Foothill+Dr+Salt+Lake+City+ON";
    String requestURL = "https://maps.googleapis.com/maps/api/distancematrix/json?origins="+ origin + "&destinations=" + destination + "&units=imperial&key=" + APIKey;
    Future<DistanceJSON> results = fetchDistanceJSON(requestURL);
  }

  void sortRestaurants(String foodItem, Future<Post> results){
    results.forEach(RestaurantJSON restaurantJSON){   //FIND OUT HOW TO GET THE FUTURE OBJECT INTO A RESTAURANT OBJECT
      Restaurant r = new Restaurant(restaurantJSON);

    }
  }

  String getCusineType(String foodName) {
    switch(foodName){
      case "burgers":
        {
          return "American";
        }
        break;

      case "pizza":
        {
          return "Italian";
        }
        break;

      case "sushi":
        {
          return "Japanese";
        }
        break;

      case "ramen":
        {
          return "Japanese";
        }
        break;

      case "italian food":
        {
          return "Italian";
        }
        break;

      case "pasta":
        {
          return "Italian";
        }
        break;

      case "salad":
        {
          return "American";
        }
        break;

      case "sandwich":
        {
          return "American";
        }
        break;

      case "American BBQ":
        {
          return "American";
        }
        break;

      case "pho":
        {
          return "Vietnamese";
        }
        break;

      case "tacos":
        {
          return "Mexican";
        }
        break;

      case "ice cream":
        {
          return "American";
        }
        break;

      case "dumplings":
        {
          return "Chinese";
        }
        break;

      case "chinese food":
        {
          return "Chinese";
        }
        break;

      case "bread":
        {
          return "American";
        }
        break;

      case "steak":
        {
          return "American";
        }
        break;

      case "fried chicken":
        {
          return "American";
        }
        break;

      case "lobster":
        {
          return "American";
        }
        break;

      case "milkshake":
        {
          return "American";
        }
        break;

      case "smoothie":
        {
          return "American";
        }
        break;

      case "burrito":
        {
          return "Mexican";
        }
        break;

      case "coffee":
        {
          return "American";
        }
        break;

      default:
        {
          return "American";
        }
        break;
    }
  }

  void createCard(String foodItem){
    String imageFilename = foodItem + ".jpg";
    List<Restaurant> restaurants = new List<Restaurant>();
    List<Delivery> deliveryOptions = new List<Delivery>();
    String cusineType = getCusineType(foodItem);
    Card c = new Card(imageFilename, foodItem, restaurants, deliveryOptions, cusineType);
    cards.add(c);
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