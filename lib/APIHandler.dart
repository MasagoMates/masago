import 'dart:collection';
import'dart:async';

import 'package:flutter/services.dart';

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
  }

  List<String> createFoodsList(){
    List<String> foods = new List<String>();
    foods.add("burgers");
    foods.add("pizza");
    foods.add("sushi");
    foods.add("ramen");
    foods.add("italian food");
    foods.add("pasta");
    foods.add("salad");
    foods.add("sandwich");
    foods.add("American BBQ");
    foods.add("pho");
    foods.add("tacos");
    foods.add("ice cream");
    foods.add("dumplings");
    foods.add("chinese food");
    foods.add("bread");
    foods.add("steak");
    foods.add("fried chicken");
    foods.add("lobster");
    foods.add("milkshake");
    foods.add("smoothie");
    foods.add("burrito");
    foods.add("vegan");
    foods.add("coffee");
  }



  /*
  Calls the Google API to get data about places nearby
   */
  void callGoogleMapsAPI(String query){
    String requestURL = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + query + "&key=" + APIKey;
    fetchPost(requestURL);
    }

  Future<Post> fetchPost(String URL) async {
    final response = await http.get(URL);

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    }else{
      throw Exception('FAILED TO SEND/RECIEVE POST REQUEST');
    }
  }


  /*
  Creates a restaurant and adds it into the card
  */
  void sortPlacesByFood(){

  }

  /*
  Creates a card and adds it into the Queue of cards
   */
  void createCard(String foodName, Restaurant restaurant)
  {
    String imageFilename = foodName + ".jpg";

    List<Restaurant> restaurants = new List<Restaurant>();
    restaurants.add(restaurant);


    Delivery deliveryOption1 = new Delivery("UberEats", "UberEats.jpg", restaurant, 3.00 , 10);
    Delivery deliveryOption2 = new Delivery("GrubHub", "GrubHub.jpg", restaurant, 6.00 , 5);
    List<Delivery> deliveryOptions = new List<Delivery>();
    deliveryOptions.add(deliveryOption1);

    String cusineType = getCusineType(foodName);

    Card currentCard = new Card(imageFilename, foodName, restaurants, deliveryOptions, cusineType);
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

}