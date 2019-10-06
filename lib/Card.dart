import 'Restaurant.dart';
import 'Delivery.dart';

class Card {
  String image;     //PLEASE CHANGE THIS LATER DOWN THE LINE... IMAGES ARENT STRINGS.. I REPEAT.. IMAGES ARENT STRINGS
  String description;
  List<Restaurant> restaurants;
  List<Delivery> deliveryOptions;
  String cusineType;

  /*
  Food object constructor.

    <param name="imageFilename">the filename of the image of the food</param>
    <param name="_description">a short description of the food</param>
    <param name="_restaurants">the restaurants that serve the type of food</param>
    <param name="_deliveryOptions">the delivery options that will deliver the food to the user</param>
    <param name="_cusineType">the type of cusine </param>
   */
  Food(String imageFilename, String _description, List<Restaurant> _restaurants, List<Delivery> _deliveryOptions, String _cusineType)
  {
    image = imageFilename;
    description = _description;
    _restaurants.forEach((element) => restaurants.add(element));
    _deliveryOptions.forEach((element) => deliveryOptions.add(element));
    cusineType = _cusineType;
  }









}