import 'dart:collection';

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
    foods.add("bar");
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


    }

  Future<Post> fetchPost(String URL) async {
    final response = await http.get(URL);

    if (response.statusCode == 200) {

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
  void createCard()
  {

  }








}