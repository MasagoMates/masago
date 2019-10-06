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
  Card(String imageFilename, String _description, List<Restaurant> _restaurants, List<Delivery> _deliveryOptions, String _cusineType)
  {
    image = imageFilename;
    description = _description;
    _restaurants.forEach((element) => restaurants.add(element));
    _deliveryOptions.forEach((element) => deliveryOptions.add(element));
    cusineType = _cusineType;
  }

  /*
  Creates a card THIS IS JUST A DEMO WHERE DELIVERY ISNT IMPLIMENTED SO IT IS HARD CODED.
   */
  Card.fromCard (String foodName, Restaurant restaurant){
    image = foodName + ".jpg";
    description = foodName;

    restaurants = new List<Restaurant>();
    restaurants.add(restaurant);

    Delivery deliveryOption1 = new Delivery("UberEats", "UberEats.jpg", restaurant, 3.00 , 10);
    Delivery deliveryOption2 = new Delivery("GrubHub", "GrubHub.jpg", restaurant, 6.00 , 5);
    deliveryOptions = new List<Delivery>();
    deliveryOptions.add(deliveryOption1);
    deliveryOptions.add(deliveryOption2);

    cusineType = getCusineType(foodName);
  }

  void addRestaurant(Restaurant restaurant){
    for(int i = 0; i < restaurants.length; i++){
      if(restaurants[i].restaurantName.compareTo(restaurant.restaurantName) == 0){
        return;
      }
    }
    restaurants.add(restaurant);
  }

  void addDelivery(Delivery delivery){
    deliveryOptions.add(delivery);
  }


}